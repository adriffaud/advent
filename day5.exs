defmodule Day5 do
  @test_input """
  0,9 -> 5,9
  8,0 -> 0,8
  9,4 -> 3,4
  2,2 -> 2,1
  7,0 -> 7,4
  6,4 -> 2,0
  0,9 -> 2,9
  3,4 -> 1,4
  0,0 -> 8,8
  5,5 -> 8,2
  """

  @input File.read!("./inputs/day5.txt")

  defp parse(input) do
    input
    |> String.split(~r{\n}, trim: true)
    |> Enum.map(fn line ->
      line
      |> String.split(" -> ")
      |> Enum.map(fn pair ->
        pair
        |> String.split(",")
        |> Enum.map(&String.to_integer(&1))
      end)
    end)
  end

  defp expand([[x1, y1], [x2, y2]]) do
    cond do
      # Horizontal
      x1 == x2 ->
        Enum.map(y1..y2, &[x1, &1])

      # Vertical
      y1 == y2 ->
        Enum.map(x1..x2, &[&1, y1])

      # Diagonal
      abs(x1 - x2) == abs(y1 - y2) ->
        Enum.zip(x1..x2, y1..y2)
        |> Enum.map(&Tuple.to_list(&1))
    end
  end

  def part1 do
    count =
      @input
      |> parse()
      |> Enum.filter(fn [[x1, y1], [x2, y2]] -> x1 == x2 or y1 == y2 end)
      |> Enum.map(&expand(&1))
      |> Enum.concat()
      |> Enum.frequencies()
      |> Map.values()
      |> Enum.filter(&(&1 > 1))
      |> Enum.count()

    IO.puts("Part 1: #{count}")
  end

  def part2 do
    count =
      @input
      |> parse()
      |> Enum.map(&expand(&1))
      |> Enum.concat()
      |> Enum.frequencies()
      |> Map.values()
      |> Enum.filter(&(&1 > 1))
      |> Enum.count()

    IO.inspect(count)
  end
end

Day5.part2()
