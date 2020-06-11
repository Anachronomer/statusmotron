defmodule StatusmotronUIWeb.StatusController do
  use StatusmotronUIWeb, :controller
  require StatuslightControl.Statuslight

  def set_status(conn, params) do
    color = color_for_status(params["status"])
    :ets.insert(:dumping_ground, color: color)
    StatuslightControl.Statuslight.set_color(color)
    json(conn, %{ color: :ets.lookup(:dumping_ground, :color)[:color] })
  end

  def color_for_status("idle") do
    "#00FF00"
  end

  def color_for_status("busy") do
    "#FFFF00"
  end

  def color_for_status("dnd") do
    "#FF0000"
  end

  def color_for_status("away") do
    "#000000"
  end
end
