# problem 1 & 2

input = File.read('15.input').split("\n")

ingredients = []

input.each do |line|
  ingredient, tail = line.split(': ')
  effects = tail.split(', ')

  ingredients.push({
    'name' => ingredient,
    'effects' => effects.map { |v| [v.split(' ')[0], v.split(' ')[1].to_i] }.to_h
  })
end

def apply_ingredients(acc, effects, times)
  effects.keys.each do |effect|
    value = effects[effect]

    acc[effect] ||= 0
    acc[effect] += value * times
  end

  acc
end

best1 = 0
best2 = 0

v1 = 1
while v1 <= 100
  v2 = 1
  while v1 + v2 <= 100
    v3 = 1
    while v1 + v2 + v3 <= 100
      v4 = 1
      while v1 + v2 + v3 + v4 <= 100
        acc = {}
        apply_ingredients(acc, ingredients[0]['effects'], v1)
        apply_ingredients(acc, ingredients[1]['effects'], v2)
        apply_ingredients(acc, ingredients[2]['effects'], v3)
        apply_ingredients(acc, ingredients[3]['effects'], v4)

        if acc['calories'] == 500
          acc['calories'] = 1
          best2 = [best2, acc.values.map { |v| v < 0 ? 0 : v }.inject(:*)].max
        end

        acc['calories'] = 1
        best1 = [best1, acc.values.map { |v| v < 0 ? 0 : v }.inject(:*)].max

        v4 += 1
      end
      v3 += 1
    end
    v2 += 1
  end
  v1 += 1
end

p best1
p best2
