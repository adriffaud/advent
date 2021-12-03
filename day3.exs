test_input =
  """
  00100
  11110
  10110
  10111
  10101
  01111
  00111
  11100
  10000
  11001
  00010
  01010
  """
  |> String.split(~r{\n}, trim: true)

input =
  File.read!("./inputs/day3.txt")
  |> String.split(~r{\n}, trim: true)

res =
  input
  |> Enum.map(&String.graphemes(&1))
  |> Enum.map(fn el -> Enum.map(el, &String.to_integer(&1)) end)
  |> Enum.zip()

frequencies = Enum.map(res, fn el -> el |> Tuple.to_list() |> Enum.frequencies() end)

IO.puts("Part 1")

gamma_rate =
  Enum.reduce(frequencies, [], fn el, acc ->
    if el[0] > el[1] do
      [0 | acc]
    else
      [1 | acc]
    end
  end)
  |> Enum.reverse()
  |> Integer.undigits(2)

IO.puts("Gamma rate: #{gamma_rate}")

epsilon_rate =
  Enum.reduce(frequencies, [], fn el, acc ->
    if el[0] < el[1] do
      [0 | acc]
    else
      [1 | acc]
    end
  end)
  |> Enum.reverse()
  |> Integer.undigits(2)

IO.puts("Epsilon rate: #{epsilon_rate}")

IO.puts("Power consumption: #{gamma_rate * epsilon_rate}")
