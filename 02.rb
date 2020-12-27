# problem 1

input = File.read('02.input').split("\n")

total = 0

input.each do |line|
  l, w, h = line.split('x')
  l = l.to_i
  w = w.to_i
  h = h.to_i

  total += 2 * l * w + 2 * w * h + 2 * h * l + [l * w, w * h, h * l].min
end

puts total

# problem 2

ribbon = 0

input.each do |line|
  l, w, h = line.split('x')
  l = l.to_i
  w = w.to_i
  h = h.to_i

  max_side = [l, w, h].max
  sm1, sm2 = [l, w, h] - [max_side] + [max_side]

  ribbon += 2 * sm1 + 2 * sm2 + l * w * h
end

puts ribbon
