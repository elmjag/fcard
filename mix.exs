defmodule Fcards.MixProject do
  use Mix.Project

  def project do
    [
      app: :fcards,
      version: "0.0.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: [main_module: Cli],
      releases: [
        fcards: [
          steps: [:assemble, &Bakeware.assemble/1]
        ]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Fcards, []}
    ]
  end

  defp deps do
    [
      {:bakeware, "~> 0.2.4"},
      {:exqlite, "~> 0.13"}
    ]
  end
end
