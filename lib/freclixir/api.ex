defmodule Freclixir.Api do
  @base_url "https://api.letsfreckle.com/v2"
  @user_agent "FreCLIxir/#{Freclixir.version}"

  def get(path) do
    path
    |> url
    |> HTTPoison.get(headers())
    |> decode
  end

  def put(path, body \\ "") do
    path
    |> url
    |> HTTPoison.put(body, headers())
    |> decode
  end

  defp decode({:ok, response}), do: Poison.decode(response.body)
  defp url(path), do: Enum.join [@base_url, path], "/"

  defp headers do
    ["X-FreckleToken": token(),
     "User-Agent": @user_agent]
  end

  defp token do
    Freclixir.Config.token
  end
end
