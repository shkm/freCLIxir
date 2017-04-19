defmodule Freclixir.Cli do
  alias Freclixir.Cli.Projects
  alias Freclixir.Cli.Timers

  def main(args \\ []) do
    args
    |> parse_args
    |> process
  end

  def print_error(reason), do: IO.puts "Error: #{reason}"

  defp parse_args(args) do
    options = OptionParser.parse(args, switches: [version: :boolean])

    case options do
      {[version: true], _, _} -> :version
      {_, ["timers"], _} -> [Timers, :help]
      {_, ["timers", "list"], _} -> [Timers, :list]
      {_, ["timers", "pause"], _} -> [Timers, :pause]
      {_, ["timers", "start", project_id], _} -> [Timers, :start, [project_id]]
      {_, ["projects"], _} -> [Projects, :help]
      {_, ["projects", "list"], _} -> [Projects, :list]
      _ -> :help
    end
  end

  defp process([module, function]), do: process([module, function, []])
  defp process([module, function, args]), do: Kernel.apply(module, function, args)
  defp process(:version), do: IO.puts "FreCLIxir #{Freclixir.version}"

  # TODO: write proper help
  defp process(:help), do: IO.puts "FreCLIxir #{Freclixir.version}"
end
