defmodule Grep do
  @spec grep(String.t(), [String.t()], [String.t()]) :: String.t()
  def grep(pattern, flags, files) do
    all_flags = %{n: "-n" in flags, l: "-l" in flags, 
              i: "-i" in flags, v: "-v" in flags, x: "-x" in flags, m: length(files)>1}
    files |> Enum.flat_map(& grepfile(pattern, all_flags, &1)) |> create_output(all_flags)
  end

  defp grepfile(pattern, flags, path) do
    pat = if flags.x, do: "^#{pattern}$", else: pattern
    regex = Regex.compile!(pat, (if flags.i, do: [:caseless], else: [])) 
    File.stream!(path)
    |> Enum.with_index(fn line, index -> {path, index+1, line, Regex.match?(regex, line)} end)
    |> Enum.filter(fn {_, _, _, m} -> (m and not flags.v) or (not m and flags.v) end)
  end

  defp create_output([], _flags), do: ""
  defp create_output(matches, flags) when flags.l do
    (matches |> Enum.map(& elem(&1, 0)) |> Enum.uniq |> Enum.join("\n")) <> "\n"
  end

  defp create_output(matches, flags) do
    prefix = fn val, flag -> if flag, do: "#{val}:", else: "" end
    matches
    |> Enum.map(fn {file, n, line, _} -> "#{prefix.(file, flags.m)}#{prefix.(n, flags.n)}#{line}" end)
    |> Enum.join("")
  end

end
