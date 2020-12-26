# problem 1

input = File.read('01.input')

floor = 0

input.chars.each do |c|
  if c == '('
    floor += 1
  elsif c == ')'
    floor -= 1
  end
end

puts floor

# problem 2

floor = 0

input.chars.each.with_index do |c, idx|
  if c == '('
    floor += 1
  elsif c == ')'
    floor -= 1
  end

  if floor == -1
    puts idx + 1
    break
  end
end
