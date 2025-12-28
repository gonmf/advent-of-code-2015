# problem 1

input = File.read('16.input_2').split("\n")

goal = {}

input.each do |line|
  name, nr = line.split(': ')
  goal[name] = nr.to_i
end

def shoe_fits(goal, shoe)
  shoe.keys.each do |key|
    val = shoe[key]

    return false if goal[key] != val
  end

  true
end

input = File.read('16.input').split("\n")

sue_nr_1 = nil

input.each do |line|
  i = line.index(': ')
  head = line[0, i]
  sue_nr = head.split(' ')[1].to_i
  tail = line[i + 2, line.size]
  tail = tail.split(', ').map { |v| [v.split(': ')[0], v.split(': ')[1].to_i] }.to_h

  if shoe_fits(goal, tail)
    sue_nr_1 = sue_nr
    break
  end
end

p sue_nr_1

# problem 2

def shoe_fits2(goal, shoe)
  shoe.keys.each do |key|
    val = shoe[key]

    if key == 'cats' || key == 'trees'
      return false if goal[key] > val
      next
    end

    if key == 'pomeranians' || key == 'goldfish'
      return false if goal[key] < val
      next
    end

    return false if goal[key] != val
  end

  true
end

input.each do |line|
  i = line.index(': ')
  head = line[0, i]
  sue_nr = head.split(' ')[1].to_i
  next if sue_nr == sue_nr_1

  tail = line[i + 2, line.size]
  tail = tail.split(', ').map { |v| [v.split(': ')[0], v.split(': ')[1].to_i] }.to_h

  if shoe_fits2(goal, tail)
    puts sue_nr
    break
  end
end
