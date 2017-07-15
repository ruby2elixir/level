defmodule Bridge.Web.TeamControllerTest do
  use Bridge.Web.ConnCase

  describe "GET /teams" do
    setup %{conn: conn} do
      conn =
        conn
        |> put_launch_host()
        |> bypass_through(Bridge.Web.Router, :browser)
        |> get("/")

      {:ok, %{conn: conn}}
    end

    test "redirects to search if not signed in to any teams", %{conn: conn} do
      conn =
        conn
        |> recycle()
        |> put_launch_host()
        |> get("/teams")

      assert conn.host == "launch.bridge.test"
      assert redirected_to(conn, 302) =~ "/"
    end

    test "renders the list of signed in teams", %{conn: conn} do
      {:ok, %{team: team, user: user}} = insert_signup()

      conn =
        conn
        |> sign_in(team, user)
        |> put_launch_host()
        |> get("/teams")

      body = html_response(conn, 200)
      assert body =~ "My Teams"
      assert body =~ team.name
    end
  end

  describe "GET /teams/new" do
    test "returns ok status", %{conn: conn} do
      conn =
        conn
        |> put_launch_host()
        |> get("/teams/new")

      assert html_response(conn, 200)
    end
  end
end
