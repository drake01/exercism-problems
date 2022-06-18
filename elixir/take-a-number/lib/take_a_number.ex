defmodule TakeANumber do

  @state 0
  @state_key  :ticket

  def start(), do: spawn(&func/0)

  def func do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, get_ticket())
      {:take_a_number, sender_pid} ->
        next_ticket = get_ticket()+1
        send(sender_pid, next_ticket)
        Process.put(@state_key, next_ticket)
      :stop ->
        exit(:stop)
      _ -> nil
    end
    func()
  end

  defp get_ticket, do: Process.get(@state_key, @state)

end
