puts File.open("input.txt")
      .readlines
      .map(&:split)
      .transpose
      .map(&:sort)
      .transpose
      .map { |l,r| (l.to_i - r.to_i).abs }      
      .sum      
