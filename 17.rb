input = File.read('17.input').split("\n")

# problem 1

containers = []

input.each do |line|
  containers.push(line.to_i)
end

def count_combs(containers, idx, to_fill)
  return 1 if to_fill == 0
  return 0 if idx == containers.size

  container = containers[idx]
  count_combs(containers, idx + 1, to_fill) + count_combs(containers, idx + 1, to_fill - container)
end

p count_combs(containers, 0, 150)

# problem 2

def count_combs(containers, idx, to_fill, nr_containers, result)
  if to_fill == 0
    if nr_containers < result[0]
      result[0] = nr_containers
      result[1] = 1
    elsif nr_containers == result[0]
      result[1] += 1
    end
    return
  end
  return if idx == containers.size

  container = containers[idx]
  count_combs(containers, idx + 1, to_fill, nr_containers, result)
  count_combs(containers, idx + 1, to_fill - container, nr_containers + 1, result)
end

result = [9999999999, 0]
count_combs(containers, 0, 150, 0, result)
p result[1]
