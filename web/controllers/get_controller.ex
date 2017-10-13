defmodule Shorten.GetController do
  use Shorten.Web, :controller

  def get(conn = %{request_path: path}, _params) do
    %{"metadata" => %{"route" => route}} = Cosmic.get("jd-routes")
    path = String.downcase(path)

    tuple_or_nil =
      route
      |> Enum.map(&prepare/1)
      |> Enum.filter(&(matches(&1, path)))
      |> List.first()

    destination =
      case tuple_or_nil do
        nil -> "https://justicedemocrats.com"
        {_, destination} -> destination
      end

    redirect conn, external: destination
  end

  defp matches({regex, destination}, path) do
    Regex.run(regex, path) != nil
  end

  defp prepare(%{"from" => from_regex, "to" => to_url}) do
    {:ok, from} = from_regex |> String.downcase() |> Regex.compile()
    {from, to_url}
  end
end
