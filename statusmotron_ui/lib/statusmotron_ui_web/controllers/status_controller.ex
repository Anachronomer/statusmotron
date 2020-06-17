defmodule StatusmotronUIWeb.StatusController do
  use StatusmotronUIWeb, :controller
  require StatuslightControl.Statuslight
  @color_status_map %{
    "idle" => "#00FF00",
    "busy" => "#FFFF00",
    "dnd"  => "#FF0000",
    "away" => "#000000"
  }

  def set_status(conn, %{"status" => status} = _params) do
    color = @color_status_map[status]
    StatuslightControl.Statuslight.set_color(color)
    json(conn, %{ color: color })
  end
end
