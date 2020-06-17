defmodule StatusmotronUIWeb.PageController do
  use StatusmotronUIWeb, :controller

  def index(conn, _params) do
    conn
    |> assign(:color, StatuslightControl.Statuslight.current_color())
    |> render("index.html")
  end
end
