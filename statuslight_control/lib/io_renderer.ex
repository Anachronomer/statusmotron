defmodule IORenderer do

  def fill(origin, width, height, color) do
    IO.puts("Filling a patch #{inspect(width)} wide and #{inspect(height)} high starting at point #{inspect(origin)}, with color #{inspect(color)}")
  end

  def render() do
    IO.puts("Rendering")
  end
end
