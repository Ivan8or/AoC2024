pp File.open("input.txt")
  .readlines
  .map(&:chomp)
  .map(&:chars)
  .then { |m|
    (-> (mat) {
      (0...mat.size)
        .to_a
        .product((0...mat.size).to_a)
        .group_by(&:sum)
        .map { |i, arr|
          arr.map { |r,c| mat[r][c] }
        }
    })
    .then { |rot45|
      [
        m,
        m.transpose,
        rot45.call(m),
        rot45.call(m.map(&:reverse)),
      ]
    }
    .flat_map { |e| [e,e.map(&:reverse)] }
    .flatten(1)
    .flat_map { |r| r.each_cons(4).to_a }
    .map(&:join)
    .filter { |r| r == "XMAS" }
    .size    
  }
