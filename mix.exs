defmodule MbcsRs.MixProject do
  use Mix.Project

  def project do
    [
      app: :mbcs_rs,
      version: "0.1.2",
      elixir: "~> 1.6",
      description: "MBCS converter using ruster with encoding crate",
      package: [
        maintainers: ["enpedasi"],
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/enpedasi/mbcs_rs"},
        files: ["lib", "native", "mix.exs", "README.md", "LICENSE"]
      ],
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
      {:ex_doc, "~> 0.19.1", runtime: false, only: [:dev, :test]},
      {:credo, "~> 0.9.3", runtime: false, only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: [:dev, :test], runtime: false},
      {:rustler, "~> 0.20"}
    ]
  end

  defp rustler_crates() do
    [
      mbcs_rs: [
        path: "native/mbcs_rs",
        mode: :release
      ]
    ]
  end
end
