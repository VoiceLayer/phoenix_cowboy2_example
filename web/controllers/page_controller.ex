defmodule PhoenixCowboy2Example.PageController do
  use PhoenixCowboy2Example.Web, :controller

  def index(conn, _params) do
    http2 =
      case conn.adapter do
        {_, %{version: :"HTTP/2"}} -> true
        _                          -> false
      end

    assets = ["/css/app.css", "/js/app.js",
      "/images/chart.png", "/images/book.jpg",
      "/images/unicorn.jpg", "/images/magic.jpg"]

    for path <- assets do
      Plug.Conn.H2.push(conn, path,
      [{"accept", MIME.from_path(path)}])
    end

    render conn, "index.html", http2: http2
  end
end
