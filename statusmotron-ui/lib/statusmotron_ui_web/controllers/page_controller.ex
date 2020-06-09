defmodule StatusmotronUIWeb.PageController do
  use StatusmotronUIWeb, :controller

  def index(conn, _params) do
    render conn, "index.html", :ets.lookup(:dumping_ground, :color)
  end
end
