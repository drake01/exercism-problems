defmodule LogLevel do

  def to_label(level, legacy?) do
    cond do
      {level, legacy?} == {0, false} ->
       :trace
      level === 1 ->
       :debug
      level === 2 ->
       :info
      level === 3 ->
       :warning
      level === 4 ->
       :error
      {level, legacy?} == {5, false} ->
       :fatal
      true ->
       :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    cond do
      label === :error ->
       :ops
      label === :fatal ->
       :ops
      {label, legacy?} == {:unknown, true} ->
       :dev1
      {label, legacy?} == {:unknown, false} ->
       :dev2
      true ->
       false
    end

  end
end
