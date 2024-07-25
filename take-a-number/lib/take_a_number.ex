defmodule TakeANumber do
  def start() do
    spawn(&loop/0)
  end

  defp loop(number \\ 0) do
    receive do
      {:report_state, sender} ->
        send(sender, number)
        loop(number)

      {:take_a_number, sender} ->
        number = number + 1
        send(sender, number)
        loop(number)

      :stop ->
        nil

      _ ->
        loop(number)
    end
  end
end
