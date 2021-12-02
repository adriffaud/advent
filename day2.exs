test_input =
  """
  forward 5
  down 5
  forward 8
  up 3
  down 8
  forward 2
  """
  |> String.split(~r{\n}, trim: true)
  |> Enum.map(fn l -> String.split(l, " ") end)

input =
  File.read!("./inputs/day2.txt")
  |> String.split(~r{\n}, trim: true)
  |> Enum.map(fn l -> String.split(l, " ") end)

part1 =
  Enum.reduce(input, %{horizontal: 0, depth: 0}, fn
    el, acc ->
      case(List.first(el)) do
        "forward" ->
          %{acc | horizontal: (el |> List.last() |> String.to_integer()) + acc.horizontal}

        "down" ->
          %{acc | depth: acc.depth + (el |> List.last() |> String.to_integer())}

        "up" ->
          %{acc | depth: acc.depth - (el |> List.last() |> String.to_integer())}
      end
  end)

IO.inspect(part1)
IO.inspect(part1.horizontal * part1.depth)

part2 =
  Enum.reduce(input, %{horizontal: 0, aim: 0, depth: 0}, fn
    el, acc ->
      case(List.first(el)) do
        "forward" ->
          value =
            el
            |> List.last()
            |> String.to_integer()

          %{acc | horizontal: value + acc.horizontal, depth: acc.depth + acc.aim * value}

        "down" ->
          %{acc | aim: acc.aim + (el |> List.last() |> String.to_integer())}

        "up" ->
          %{acc | aim: acc.aim - (el |> List.last() |> String.to_integer())}
      end
  end)

IO.inspect(part2)
IO.inspect(part2.horizontal * part2.depth)
