input = File.read('24.input').split("\n")

# problem 1

weights = input.map { |line| line.to_i }

def quantum_entanglement(arr)
  arr.inject(:*)
end

# problem 1

def search(weights, total_weight, goal_weight, sol, result)
  if total_weight == goal_weight
    return if result[0] < sol.size
    score = quantum_entanglement(sol)
    return if result[1] <= score

    result[0] = sol.size
    result[1] = score
    return
  end

  weights.each.with_index do |weight, idx|
    next if weight + total_weight > goal_weight

    search(weights[idx + 1, weights.size], weight + total_weight, goal_weight, sol + [weight], result)
  end
end

result = [999, 9999999999999]
search(weights, 0, weights.sum / 3, [], result)
p result[1]

# problem 2

result = [999, 9999999999999]
search(weights, 0, weights.sum / 4, [], result)
p result[1]
