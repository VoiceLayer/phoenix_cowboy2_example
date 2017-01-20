defmodule PhoenixCowboy2Example.PageControllerTest do
  use PhoenixCowboy2Example.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
