defmodule Freclixir.Api.Timer do
  def all do
    Freclixir.Api.get("timers")
  end

  def start(project_id) do
    Freclixir.Api.put("projects/#{project_id}/timer/start")
  end

  def pause do
    with {:ok, timer} <- running() do
      Freclixir.Api.put("projects/#{timer["project"]["id"]}/timer/pause")
    end
  end

  defp running do
    {:ok, timers} = all()

    timer = Enum.find(timers, fn(timer) ->
      timer["state"] == "running"
    end)

    case timer do
      nil -> {:error, "No running timer to pause."}
      _ -> {:ok, timer}
    end
  end
end
