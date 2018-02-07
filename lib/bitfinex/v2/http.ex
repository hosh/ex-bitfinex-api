defmodule Bitfinex.V2.Http do
  @moduledoc """
  HTTP helpers for Bitfinex
  """

  def base_url(:v2) do
    "https://api.bitfinex.com/v2"
  end

  def endpoint(version, method) do
    [base_url(version), method]
  end

  def endpoint(version, method, nil) do
    [base_url(version), method]
  end

  def endpoint(version, method, params) when is_map(params) do
    [endpoint(version, method, nil), "?", URI.encode_query(params)]
  end

  def get(method), do: get(:v2, method, nil)
  def get(method, params), do: get(:v2, method, params)

  # Returns a tuple {status, result}
  def get(version, method, params) do
    endpoint(version, method, params)
    |> HTTPoison.get
    |> api_response
  end

  def api_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    {:ok, Map.get(Poison.decode!(body), "result")}
  end

  def api_response({:ok, %HTTPoison.Response{status_code: _, body: body}}) do
    {:error, Map.get(Poison.decode!(body), "error") }
  end

  def api_response(_) do
    {:error, %{}}
  end
end
