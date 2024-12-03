puts File.open("input.txt")
  .read
  .scan(/mul\((\d{1,3}),(\d{1,3})\)/)
  .map { |e| e[0].to_i * e[1].to_i }
  .sum

