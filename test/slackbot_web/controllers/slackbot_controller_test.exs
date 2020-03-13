defmodule SlackbotWeb.SlackbotControllerTest do
  use SlackbotWeb.ConnCase, async: true

  test "initial test", %{conn: conn} do
    res = post(conn, "/")

    assert res.status == 200
  end
end
