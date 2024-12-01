l,r = File.open("input.txt")
      .readlines
      .map(&:split)
      .transpose

agg = r.tally

puts l
  .map { |e| e.to_i * (agg[e] || 0) }
  .sum
