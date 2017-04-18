defmodule Freclixir.Mixfile do
  use Mix.Project

  def project do
    [app: :freclixir,
     version: "0.2.0",
     elixir: "~> 1.4",
     escript: [main_module: Freclixir.Cli],
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger],
     applications: [:httpoison, :table_rex]]
  end

  defp deps do
    [{:httpoison, "~> 0.10.0"},
     {:table_rex, "~> 0.10"},
     {:poison, "~> 3.0"},
     {:yaml_elixir, "~> 1.1"}]
  end
end
