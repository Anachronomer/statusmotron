defmodule StatusmotronWeb.StatusController do
  use StatusmotronWeb, :controller

  def set_status(conn, params) do
    :ets.insert(:dumping_ground, color: color_for_status(params["status"]))
    json(conn, %{ color: :ets.lookup(:dumping_ground, :color)[:color] })
  end

  def color_for_status("idle") do
    "green"
  end

  def color_for_status("busy") do
    "yellow"
  end

  def color_for_status("dnd") do
    "red"
  end
end
