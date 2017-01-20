defmodule PhoenixCowboy2Example.PageController do
  use PhoenixCowboy2Example.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
