defmodule MbcsRs.MixProject do
  use Mix.Project

  def project do
    [
      app: :mbcs_rs,
      version: "0.1.0",
      elixir: "~> 1.7",
      compilers: [:rustler] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      rustler_crates: rustler_crates(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:credo, "~> 0.9.3", runtime: false, only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: [:dev, :test], runtime: false},
      {:rustler, "~> 0.18.0"}
    ]
  end

  defp rustler_crates() do
    [
      mbcs_rs: [
        path: "native/mbcs_rs",
        # (if Mix.env == :prod, do: :release, else: :debug),
        mode: :release
      ]
    ]
  end
end
