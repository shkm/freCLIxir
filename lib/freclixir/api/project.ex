defmodule Freclixir.Api.Project do
  def find_by_name(name) do
    {:ok, projects} = all()

    downcased_name = String.downcase(name)

    project = Enum.find(projects, fn(project) ->
      String.downcase(project["name"]) == downcased_name
    end)

    case project do
      nil -> {:error, "Cannot find project named #{name}."}
      _ -> {:ok, project}
    end
  end

  def all do
    Freclixir.Api.get("projects")
  end
end
