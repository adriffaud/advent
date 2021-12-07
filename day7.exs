test_input = "16,1,2,0,4,2,7,1,2,14"

parsed =
  File.read!("./inputs/day7.txt")
  |> String.split(",", trim: true)
  |> Enum.map(&String.to_integer/1)

min = Enum.min(parsed)
max = Enum.max(parsed)

Enum.map(min..max, fn idx -> Enum.map(parsed, fn pos -> abs(pos - idx) end) end)
|> Enum.map(&Enum.sum/1)
|> Enum.min()
|> IO.inspect(label: "Part 1")

Enum.map(min..max, fn pos ->
  Enum.map(parsed, fn val ->
    div((abs(val - pos) + 1) * abs(val - pos), 2)
  end)
end)
|> Enum.map(&Enum.sum/1)
|> Enum.min()
|> IO.inspect(label: "Part 2")
