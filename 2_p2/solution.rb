puts File.open("input.txt")
  .readlines
  .map(&:split)
  .map { |l| l.map(&:to_i) }
  .map { |l| [l] + l.combination(l.size - 1).to_a }
  .map { |l| l
    .map { |ll| ll
      .each_cons(2)
      .map { |l,r| l - r }
      .then { |ds|
        !ds.include?(0) &&
        ds.group_by { |d| d < 0 }.size == 1 &&
        ds.reduce(true) { |acc, d| acc && (d.abs >= 1 && d.abs <= 3) }
      }
    }
    .filter(&:itself)
    .any?
  }
  .filter(&:itself)
  .size
  
      
