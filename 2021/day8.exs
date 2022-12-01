defmodule Day8 do
  def part1(input) do
    input
    |> parse()
    |> Enum.map(fn {_, output} ->
      Enum.count(output, &(MapSet.size(&1) in [2, 3, 4, 7]))
    end)
    |> Enum.sum()
    |> IO.inspect()
  end

  defp parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  defp parse_line(line) do
    [signal, output] = String.split(line, " | ")

    signal =
      signal |> String.split(" ") |> Enum.map(&String.graphemes/1) |> Enum.map(&MapSet.new/1)

    output =
      output |> String.split(" ") |> Enum.map(&String.graphemes/1) |> Enum.map(&MapSet.new/1)

    {signal, output}
  end
end

test_input = """
be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce
"""

input = File.read!("./inputs/day8.txt")

Day8.part1(input)
