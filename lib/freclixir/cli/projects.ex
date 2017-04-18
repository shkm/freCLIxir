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

    TableRex.quick_render!(rows, headers)
    |> IO.puts
  end
end
