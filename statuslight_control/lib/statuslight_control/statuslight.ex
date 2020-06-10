defmodule StatuslightControl.Statuslight do
  use GenServer

  def start_link(renderer) do
    GenServer.start_link(__MODULE__, renderer, name: StatusLight)
  end

  def stop do
    GenServer.stop(StatusLight)
  end

  def init(renderer) do
    {:ok, %{renderer: renderer} }
  end

  def set_color(color) do
    GenServer.cast(StatusLight, {:set_color, color})
  end

  def handle_cast({:set_color, color}, state) do
    bc_color = Blinkchain.Color.parse(color)
    state.renderer.fill(%Blinkchain.Point{x: 0, y: 0}, 12, 1, bc_color)
    state.renderer.render()
    {:noreply, state}
  end
end
