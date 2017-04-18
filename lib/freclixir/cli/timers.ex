defmodule Freclixir.Cli.Timers do
  alias Freclixir.Api.Timer
  alias Freclixir.Api.Project

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
    result = case Integer.parse(project_id) do
      {_, ""} -> start_by_id(project_id)
      _ -> start_by_name(project_id)
    end

    case result do
      {:ok, timer} -> IO.puts ~s{Now timing #{timer["project"]["name"]} (#{timer["formatted_time"]}).}
      {:error, :invalid, _} -> IO.puts "Error: Freckle probably couldn't find a product by that ID."
      {:error, reason} -> IO.puts "Error: #{reason}"
    end
  end

  defp start_by_id(project_id), do: Timer.start(project_id)
  defp start_by_name(project_name) do
    case Project.find_by_name(project_name) do
      {:ok, project} -> start_by_id(project["id"])
      {:error, reason} -> {:error, reason}
    end
  end
end
