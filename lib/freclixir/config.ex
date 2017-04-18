defmodule Freclixir.Config do
  @config_dir "#{System.user_home}/.freclixir"
  @token_filename "token"
  @config_filename "config"

  def token do
    Enum.join([@config_dir, @token_filename], "/")
    |> File.read
    |> case do
      {:ok, token} -> String.strip token
    end
  end

  def config do
    Enum.join([@config_dir, @config_filename], "/")
    |> YamlElixir.read_from_file
  end
end
