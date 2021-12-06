test_input = """
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

input = File.read!("./inputs/day5.txt")

lines =
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

# IO.inspect(lines)

filtered = Enum.filter(lines, fn [[x1, y1], [x2, y2]] -> x1 == x2 or y1 == y2 end)

# IO.inspect(filtered)

res =
  filtered
  |> Enum.reduce([], fn [[x1, y1], [x2, y2]], acc ->
    expanded =
      Enum.flat_map(x1..x2, fn x ->
        Enum.map(y1..y2, fn y -> [x, y] end)
      end)

    [expanded | acc]
  end)
  |> Enum.concat()
  |> Enum.frequencies()
  |> Map.values()
  |> Enum.filter(&(&1 > 1))
  |> Enum.count()

IO.inspect(res)
