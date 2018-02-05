defmodule Vuetaba.MixProject do
  use Mix.Project

  def project do
    [
      app: :vuetaba,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:grpc, :ecto, :postgrex],
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 2.0"},
      {:postgrex, "~> 0.11"},
      {:protobuf, "~> 0.5"},
      {:grpc, github: "tony612/grpc-elixir"}
    ]
  end
end
