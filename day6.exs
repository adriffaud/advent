defmodule Day6 do
  @test_input "3,4,3,1,2"

  @input File.read!("./inputs/day6.txt")

  defp parse(input) do
    input
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def count(days) do
    parsed =
      @input
      |> parse()

    fishes =
      Enum.reduce(1..days, Enum.frequencies(parsed), fn day, fish ->
        case Map.pop(fish, day - 1) do
          {nil, _} ->
            fish

          {n, fish} ->
            Map.merge(fish, %{(day + 8) => n, (day + 6) => Map.get(fish, day + 6, 0) + n})
        end
      end)
      |> Map.values()
      |> Enum.sum()

    IO.puts("#{fishes} fishes after #{days} days.")
  end
end

Day6.count(256)
