# problem 1

input = File.read('07.input').split("\n")

wires = {}

def unsigned(val)
  val & 0xffff
end

def parse_var(name, wires)
  if name.chars.all? { |c| %w[0 1 2 3 4 5 6 7 8 9].include?(c) }
    unsigned(name.to_i)
  else
    return nil if wires[name].nil?

    wires[name]
  end
end

def exec_net(lines, wires)
  updated = true

  while updated
    updated = false

    lines.each do |line|
      oper, destination = line.split(' -> ')
      next if wires[destination]

      if oper.include?(' AND ')
        part1, part2 = oper.split(' AND ')
        part1 = parse_var(part1, wires)
        part2 = parse_var(part2, wires)
        next if part1.nil? || part2.nil?

        value = unsigned(part1 & part2)
      elsif oper.include?(' OR ')
        part1, part2 = oper.split(' OR ')
        part1 = parse_var(part1, wires)
        part2 = parse_var(part2, wires)
        next if part1.nil? || part2.nil?

        value = unsigned(part1 | part2)
      elsif oper.include?(' LSHIFT ')
        part1, part2 = oper.split(' LSHIFT ')
        part1 = parse_var(part1, wires)
        part2 = parse_var(part2, wires)
        next if part1.nil? || part2.nil?

        value = unsigned(part1 << part2)
      elsif oper.include?(' RSHIFT ')
        part1, part2 = oper.split(' RSHIFT ')
        part1 = parse_var(part1, wires)
        part2 = parse_var(part2, wires)
        next if part1.nil? || part2.nil?

        value = unsigned(part1 >> part2)
      elsif oper.include?('NOT')
        _, part2 = oper.split('NOT ')
        part2 = parse_var(part2, wires)
        next if part2.nil?

        value = unsigned(~part2)
      else
        value = parse_var(oper, wires)
      end

      updated = true
      wires[destination] = value
    end
  end

  wires
end

wires = exec_net(input, {})

puts wires['a']

# problem 2

wires = { 'b' => wires['a'] }

puts exec_net(input, wires)['a']
