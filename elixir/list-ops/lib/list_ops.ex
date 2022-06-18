defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l), do: count(l, 0)
  def count([], ctr), do: ctr
  def count([_h | t], ctr), do: count(t, 1+ctr)

  @spec reverse(list) :: list
  def reverse(l), do: reverse(l, [])
  defp reverse([], templist), do: templist
  defp reverse([h | t], templist), do: reverse(t, [h | templist])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: map(l, [], f)
  def map([], templist, _cb), do: reverse(templist)
  def map([h | t], templist, cb), do: map(t, [cb.(h) | templist], cb)

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: filter(l, [], f)
  def filter([], templist, _f), do: reverse(templist)
  def filter([h | t], templist, f) do
    if f.(h) do
      filter(t, [h | templist], f)
    else
      filter(t, templist, f)
    end
  end

  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl([], acc, _f), do: acc
  def foldl([h | t], acc, f), do: foldl(t, f.(h, acc), f)

  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr([], acc, _f), do: acc
  def foldr([h | t], acc, f), do: f.(h, foldr(t, acc, f))

  @spec append(list, list) :: list
  def append(a, b), do: _append(reverse(a), b)
  def _append([], t), do: t
  def _append([h | t], ys), do: _append(t, [h | ys])

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([h | t]), do: append(h, concat(t))

end
