# problem 1

input = File.read('06.input').split("\n")

require 'set'

lights = {}

def light_val(x, y, lights)
  (lights[x] || Set.new).include?(y)
end

def set_light_val(x, y, lights, value)
  if value
    lights[x] ||= Set.new

    lights[x].add(y)
  else
    lights[x].delete(y) if lights[x]
  end
end

def toggle(corner1, corner2, lights)
  c1_x, c1_y = corner1.split(',')
  c2_x, c2_y = corner2.split(',')

  (c1_x.to_i..c2_x.to_i).each do |x|
    (c1_y.to_i..c2_y.to_i).each do |y|
      set_light_val(x, y, lights, !light_val(x, y, lights))
    end
  end
end

def set(change, corner1, corner2, lights)
  c1_x, c1_y = corner1.split(',')
  c2_x, c2_y = corner2.split(',')

  (c1_x.to_i..c2_x.to_i).each do |x|
    (c1_y.to_i..c2_y.to_i).each do |y|
      set_light_val(x, y, lights, change)
    end
  end
end

input.each do |line|
  parts = line.split(' ')

  if parts[0] == 'toggle'
    _, corner1, _, corner2 = parts

    toggle(corner1, corner2, lights)
  elsif parts[0] == 'turn'
    _, change, corner1, _, corner2 = parts
    change = change == 'on'

    set(change, corner1, corner2, lights)
  end
end

puts lights.values.map { |h| h.count }.sum

# problem 2

lights = {}

def change_brightness(corner1, corner2, lights, change)
  c1_x, c1_y = corner1.split(',')
  c2_x, c2_y = corner2.split(',')

  (c1_x.to_i..c2_x.to_i).each do |x|
    lights[x] ||= {}

    (c1_y.to_i..c2_y.to_i).each do |y|
      lights[x][y] = [(lights[x][y] || 0) + change, 0].max
    end
  end
end

input.each do |line|
  parts = line.split(' ')

  if parts[0] == 'toggle'
    _, corner1, _, corner2 = parts

    change_brightness(corner1, corner2, lights, 2)
  elsif parts[0] == 'turn'
    _, change, corner1, _, corner2 = parts

    if change == 'on'
      change_brightness(corner1, corner2, lights, 1)
    elsif change == 'off'
      change_brightness(corner1, corner2, lights, -1)
    end
  end
end

puts lights.values.map { |h| h.values.sum }.sum














