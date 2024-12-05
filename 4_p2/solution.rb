pp File.open("input.txt")
  .readlines
  .map(&:chomp)
  .map(&:chars)
  .each_cons(3)
  .to_a
  .flat_map { |rows| rows
    .transpose
    .each_cons(3)
    .to_a
  }
  .map(&:flatten)
  .map { |l| l.values_at(0,2,4,6,8) }
  .map(&:join)
  .grep(/MMASS|SSAMM|SMASM|MSAMS/)
  .size
