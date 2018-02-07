defmodule Bitfinex.Mixfile do
  use Mix.Project

  def project do
    [app: :ex_bitfinex_api,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package(),
     description: description(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  #def application do
  #  [applications: [:logger],
  #   mod: {Bitfinex, []}]
  #end

  defp deps do
    [
      {:httpoison, ">= 0.0.0"},
      {:poison, ">= 1.0.0"},
      {:credo, ">= 0.0.0", only: [:dev, :test]},
      {:mix_test_watch, "~> 0.2", only: :dev}
    ]
  end

  def package do
    [
     files: ["lib", "priv", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
     maintainers: ["Ho-Sheng Hsiao"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/hsoh/ex-bitfinex-api"}]
  end

  def description do
    """
    WIP, alpha.

    Elixir wrapper for bitfinex.com API
    """
  end
end

