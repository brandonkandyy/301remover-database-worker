defmodule DatabaseWorker.MixProject do
  use Mix.Project

  def project do
    [
      app: :database_worker,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {DatabaseWorker.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elmdb, "~> 0.4.1"},
      {:excoveralls, "~> 0.6", only: :test},
      {:freddy, "~> 0.15.0"}
    ]
  end
end
