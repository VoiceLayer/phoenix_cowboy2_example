defmodule PhoenixCowboy2Example.Mixfile do
  use Mix.Project

  def project do
    [app: :phoenix_cowboy2_example,
     version: "0.0.1",
     elixir: "~> 1.3",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {PhoenixCowboy2Example, []},
     applications: [:phoenix, :phoenix_pubsub, :phoenix_html, :phoenix_cowboy2, :logger, :gettext, :ranch, :cowlib, :cowboy]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.2.0"},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_html, "~> 2.6"},
     {:plug_cowboy2, github: "Gazler/plug_cowboy2", branch: "feat/server-push", override: true},
     {:phoenix_cowboy2, github: "voicelayer/phoenix_cowboy2"},
     {:ranch, "~> 1.4.0", override: true},
     {:cowlib, github: "ninenines/cowlib", ref: "2.0.0-rc.1", override: true, manager: :rebar3},
     {:cowboy, github: "ninenines/cowboy", override: true, manager: :rebar3},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.11"}]
  end
end
