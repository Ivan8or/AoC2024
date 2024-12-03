puts File.open("input.txt")
  .read
  .scan(/mul\((\d{1,3}),(\d{1,3})\)|(don't\(\))|(do\(\))/)
  .reduce({take: true, taken: []}) { |acc, e| ((!!e[2] || !!e[3]) ? !!e[3] : acc[:take])
    .then { |t|
      {take: t, taken: acc[:taken] + [ [t, e[0].to_i, e[1].to_i] ]}
    }
  }
  .dig(:taken)
  .filter { |_,_,e| e }
  .map { |t,l,r| (t && 1 || 0) * l * r}
  .sum
