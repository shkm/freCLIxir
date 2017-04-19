defmodule Freclixir.Cli.Projects do
  alias Freclixir.Api.Project

  def list do
    {:ok, projects} = Project.all

    headers = ["ID", "Name", "Billable"]
    rows = Enum.map projects, fn(timer) ->
      [
        timer["id"],
        timer["name"],
        timer["billable"]
      ]
    end

    IO.puts TableRex.quick_render!(rows, headers)
  end
end
