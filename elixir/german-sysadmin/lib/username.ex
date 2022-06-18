defmodule Username do

  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss
    Enum.reduce(username, '', fn char, acc ->
     acc ++ case char do
      ?ä -> 'ae'
      ?_ -> '_'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      char when char in ?a..?z -> [char]
      _ -> ''
     end
    end)

  end
end
