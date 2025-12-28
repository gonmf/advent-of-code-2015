require 'set'

input = File.read('19.input').split("\n")

# problem 1

rules = []
start = nil

input.each do |line|
  if line.include?(' => ')
    rules.push(line.split(' => '))
  elsif line != ''
    start = line
  end
end

sols = Set.new

rules.each do |rule|
  idx = 0

  while true
    i = start[idx, start.size].index(rule[0])
    break if i.nil?

    idx += i

    new_str = start[0, idx] + rule[1] + start[idx + rule[0].size, start.size]

    idx += rule[0].size

    sols.add(new_str)
  end
end

p sols.size

# problem 2

already_seen = Set.new
already_seen.add(start)
molecules = [[start, 0]]

while molecules.size > 0
  molecules = molecules.sort_by { |m| m[0].size }
  molecule, steps = molecules.shift

  if molecule == 'e'
    puts steps
    break
  end

  rules.each do |rule|
    idx = 0

    while true
      i = molecule[idx, molecule.size].index(rule[1])
      break if i.nil?

      idx += i

      new_str = molecule[0, idx] + rule[0] + molecule[idx + rule[1].size, molecule.size]

      idx += rule[1].size

      unless already_seen.include?(new_str)
        molecules.push([new_str, steps + 1])
        already_seen.add(new_str)
      end
    end
  end
end
