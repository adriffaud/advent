test_input = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

input =
  File.read!("./inputs/day1.txt")
  |> String.split(~r{\n})
  |> Enum.map(fn el -> String.to_integer(el) end)

part1 =
  Enum.chunk_every(input, 2, 1)
  |> Enum.filter(fn el -> List.last(el) > List.first(el) end)
  |> Enum.count()

IO.inspect(part1)

part2 =
  Enum.chunk_every(input, 3, 1)
  |> Enum.filter(fn el -> Enum.count(el) == 3 end)
  |> Enum.map(fn el -> Enum.sum(el) end)
  |> Enum.chunk_every(2, 1)
  |> Enum.filter(fn el -> List.last(el) > List.first(el) end)
  |> Enum.count()

IO.inspect(part2)
