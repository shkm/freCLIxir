defmodule Freclixir.Api.Timer do
  def all do
    Freclixir.Api.get("timers")
  end

  def start(project_id) do
    Freclixir.Api.put("projects/#{project_id}/timer/start")
  end

end
