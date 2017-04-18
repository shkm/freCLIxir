defmodule Freclixir.Api.Project do
  def all do
    Freclixir.Api.get("projects")
  end
end
