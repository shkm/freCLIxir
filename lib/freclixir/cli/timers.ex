defmodule Freclixir.Cli.Timers do
  alias Freclixir.Api.Timer

  def list do
    {:ok, timers} = Timer.all

    headers = ["Project", "Time", "Description", "State"]
    rows = Enum.map timers, fn(timer) ->
      [
        timer["project"]["name"],
        timer["formatted_time"],
        timer["description"],
        timer["state"]
      ]
    end

    TableRex.quick_render!(rows, headers)
    |> IO.puts
  end

  def start(project_id) do
    {:ok, timer} = Timer.start(project_id)

    IO.puts ~s{Now timing #{timer["project"]["name"]} (#{timer["formatted_time"]}).}
  end
end
