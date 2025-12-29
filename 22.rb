input = File.read('22.input').split("\n")

# problem 1

p_life = 50
p_mana = 500
b_life = input[0].split(': ')[1].to_i
b_atk = input[1].split(': ')[1].to_i

def simulate(turn, p_life, p_mana, p_armor, b_life, b_atk, effects, mana_spent, result)
  return if p_life <= 0 || p_mana <= 0 || mana_spent >= result[0]

  effects = effects.map { |e| [e[0], e[1]] }
  effects.each do |effect|
    name, turns_left = effect

    if name == 'Shield' && turns_left == 1
      p_armor -= 7
    elsif name == 'Poison'
      b_life -= 3
    elsif name == 'Recharge'
      p_mana += 101
    end

    effect[1] -= 1
  end

  if b_life <= 0
    if mana_spent < result[0]
      result[0] = mana_spent
    end
    return
  end

  effects = effects.select { |e| e[1] > 0 }

  active_effects = effects.map { |e| e[0] }

  if (turn % 2) == 0

    simulate(turn + 1, p_life, p_mana - 53, p_armor, b_life - 4, b_atk, effects, mana_spent + 53, result)
    simulate(turn + 1, p_life + 2, p_mana - 73, p_armor, b_life - 2, b_atk, effects, mana_spent + 73, result)
    simulate(turn + 1, p_life, p_mana - 113, p_armor + 7, b_life, b_atk, effects + [['Shield', 6]], mana_spent + 113, result) unless active_effects.include?('Shield')
    simulate(turn + 1, p_life, p_mana - 173, p_armor, b_life, b_atk, effects + [['Poison', 6]], mana_spent + 173, result) unless active_effects.include?('Poison')
    simulate(turn + 1, p_life, p_mana - 229, p_armor, b_life, b_atk, effects + [['Recharge', 5]], mana_spent + 229, result) unless active_effects.include?('Recharge')
  else
    dmg = [b_atk - p_armor, 1].max
    simulate(turn + 1, p_life - dmg, p_mana, p_armor, b_life, b_atk, effects, mana_spent, result)
  end
end

result = [9999999]
simulate(0, p_life, p_mana, 0, b_life, b_atk, [], 0, result)
p result[0]

# problem 2

def simulate(turn, p_life, p_mana, p_armor, b_life, b_atk, effects, mana_spent, result)
  p_life -= 1 if (turn % 2) == 0
  return if p_life <= 0 || p_mana <= 0 || mana_spent >= result[0]

  effects = effects.map { |e| [e[0], e[1]] }
  effects.each do |effect|
    name, turns_left = effect

    if name == 'Shield' && turns_left == 1
      p_armor -= 7
    elsif name == 'Poison'
      b_life -= 3
    elsif name == 'Recharge'
      p_mana += 101
    end

    effect[1] -= 1
  end

  if b_life <= 0
    if mana_spent < result[0]
      result[0] = mana_spent
    end
    return
  end

  effects = effects.select { |e| e[1] > 0 }

  active_effects = effects.map { |e| e[0] }

  if (turn % 2) == 0
    simulate(turn + 1, p_life, p_mana - 53, p_armor, b_life - 4, b_atk, effects, mana_spent + 53, result)
    simulate(turn + 1, p_life + 2, p_mana - 73, p_armor, b_life - 2, b_atk, effects, mana_spent + 73, result)
    simulate(turn + 1, p_life, p_mana - 113, p_armor + 7, b_life, b_atk, effects + [['Shield', 6]], mana_spent + 113, result) unless active_effects.include?('Shield')
    simulate(turn + 1, p_life, p_mana - 173, p_armor, b_life, b_atk, effects + [['Poison', 6]], mana_spent + 173, result) unless active_effects.include?('Poison')
    simulate(turn + 1, p_life, p_mana - 229, p_armor, b_life, b_atk, effects + [['Recharge', 5]], mana_spent + 229, result) unless active_effects.include?('Recharge')
  else
    dmg = [b_atk - p_armor, 1].max
    simulate(turn + 1, p_life - dmg, p_mana, p_armor, b_life, b_atk, effects, mana_spent, result)
  end
end

result = [9999999]
simulate(0, p_life, p_mana, 0, b_life, b_atk, [], 0, result)
p result[0]
