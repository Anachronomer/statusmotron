defmodule StatuslightControl.Statuslight do
  use GenServer
  @renderer Application.get_env(:statuslight_control, :renderer)
  @pixel_width 12
  @pixel_height 1

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{color: "green"}, name: __MODULE__)
  end

  def stop do
    GenServer.stop(__MODULE__)
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  def set_color(color) do
    GenServer.cast(__MODULE__, {:set_color, color})
  end

  def current_color() do
    GenServer.call(__MODULE__, :get_color)
  end

  @impl true
  def handle_call(:get_color, _from, %{color: color} = state), do: {:reply, color, state}

  @impl true
  def handle_cast({:set_color, color}, _state) do
    bc_color = Blinkchain.Color.parse(color)
    @renderer.fill(%Blinkchain.Point{x: 0, y: 0}, @pixel_width, @pixel_height, bc_color)
    @renderer.render()
    {:noreply, %{color: color}}
  end
end
