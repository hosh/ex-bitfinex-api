defmodule Bitfinex.V2.Rest.Public do
  @moduledoc """
  Public Bitfinex API calls, REST V2
  """

  alias Bitfinex.V2.Http, as: Http

  def platform_status do
    Http.get('/platform/status')
  end

  def tickers(symbols) when is_list(symbols) do
    symbols
    |> Enum.join(",")
    |> tickers
  end

  def tickers(symbols) when is_binary(symbols) do
    Http.get("/tickers", %{symbols: symbols})
  end

  def ticker(symbol) do
    # Single ticker endpoint does not use query param
    Http.get(["/ticker/", symbol])
  end
end


