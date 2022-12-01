test_input = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

input =
  File.read!("./inputs/day1.txt")
  |> String.split(~r{\n})
  |> Enum.map(&String.to_integer(&1))

part1 =
  Enum.chunk_every(input, 2, 1)
  |> Enum.filter(&(List.last(&1) > List.first(&1)))
  |> Enum.count()

IO.inspect(part1)

part2 =
  Enum.chunk_every(input, 3, 1)
  |> Enum.filter(&(Enum.count(&1) == 3))
  |> Enum.map(&Enum.sum(&1))
  |> Enum.chunk_every(2, 1)
  |> Enum.filter(&(List.last(&1) > List.first(&1)))
  |> Enum.count()

IO.inspect(part2)
