defmodule PhoenixCowboy2Example.Endpoint do
  use Phoenix.Endpoint, otp_app: :phoenix_cowboy2_example

  socket "/socket", PhoenixCowboy2Example.UserSocket

  plug :dial_up

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/", from: :phoenix_cowboy2_example, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_phoenix_cowboy2_example_key",
    signing_salt: "6kyaoU6S"

  plug PhoenixCowboy2Example.Router

  def dial_up(conn, _) do
    Plug.Conn.register_before_send(conn, fn conn ->
      case conn.path_info do
        [] -> :timer.sleep(1_000)
        _ -> :timer.sleep(3_000)
      end

      conn
    end)
  end
end
