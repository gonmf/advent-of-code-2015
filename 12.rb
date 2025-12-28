require 'json'

# problem 1

input = File.read('12.input')

def sum_numbers(json)
  if json.is_a?(Numeric)
    return json
  end

  if json.kind_of?(Array)
    return json.map { |v| sum_numbers(v) }.sum
  end

  if json.is_a?(Hash)
    return json.values.map { |v| sum_numbers(v) }.sum
  end

  0
end

p sum_numbers(JSON.parse(input))

# problem 2

def sum_numbers(json)
  if json.is_a?(Numeric)
    return json
  end

  if json.kind_of?(Array)
    return json.map { |v| sum_numbers(v) }.sum
  end

  if json.is_a?(Hash)
    return json.values.map { |v| sum_numbers(v) }.sum unless json.values.include?('red')
  end

  0
end

p sum_numbers(JSON.parse(input))
