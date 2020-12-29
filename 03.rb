# problem 1

require 'set'

input = File.read('03.input')

y = 0
x = 0
visited = Set.new(['0,0'])

input.chars.each do |c|
  if c == '<'
    x -= 1
  elsif c == '>'
    x += 1
  elsif c == '^'
    y += 1
  else
    y -= 1
  end

  visited.add("#{y},#{x}")
end

puts visited.count

# problem 2

s_y = 0
s_x = 0
r_y = 0
r_x = 0
visited = Set.new(['0,0'])

input.chars.each_slice(2) do |c1, c2|
  if c1 == '<'
    s_x -= 1
  elsif c1 == '>'
    s_x += 1
  elsif c1 == '^'
    s_y += 1
  else
    s_y -= 1
  end

  if c2 == '<'
    r_x -= 1
  elsif c2 == '>'
    r_x += 1
  elsif c2 == '^'
    r_y += 1
  else
    r_y -= 1
  end

  visited.add("#{s_y},#{s_x}")
  visited.add("#{r_y},#{r_x}")
end

puts visited.count
