# problem 1

input = File.read('09.input').split("\n")

def search(distances, current_city, left, acc)
  min_distance = nil
  min_city = nil
  min_cities = nil

  left.each do |city|
    distance, cities = if left.count > 1
      search(distances, city, left - [city], acc + distances[current_city][city])
    else
      [acc + distances[current_city][city], []]
    end

    if min_distance.nil? || min_distance > distance
      min_distance = distance
      min_city = city
      min_cities = cities
    end
  end

  [min_distance, [min_city] + min_cities]
end

distances = {}

input.each do |line|
  city1, _, city2, _, distance = line.split(' ')
  distance = distance.to_i

  distances[city1] ||= {}
  distances[city1][city2] = distance
  distances[city2] ||= {}
  distances[city2][city1] = distance
end

puts distances.keys.map { |city| search(distances, city, distances.keys - [city], 0).first }.min

# problem 2

def search(distances, current_city, left, acc)
  max_distance = nil
  max_city = nil
  max_cities = nil

  left.each do |city|
    distance, cities = if left.count > 1
      search(distances, city, left - [city], acc + distances[current_city][city])
    else
      [acc + distances[current_city][city], []]
    end

    if max_distance.nil? || max_distance < distance
      max_distance = distance
      max_city = city
      max_cities = cities
    end
  end

  [max_distance, [max_city] + max_cities]
end
puts distances.keys.map { |city| search(distances, city, distances.keys - [city], 0).first }.max
