input = File.read('21.input').split("\n")

boss_life = input[0].split(': ')[1].to_i
boss_atk = input[1].split(': ')[1].to_i
boss_def = input[2].split(': ')[1].to_i

boss = { boss_life: boss_life, boss_atk: boss_atk, boss_def: boss_def }

weapons = [
  [8, 4, 0],
  [10, 5, 0],
  [25, 6, 0],
  [40, 7, 0],
  [74, 8, 0]
]

armors = [
  [13, 0, 1],
  [31, 0, 2],
  [53, 0, 3],
  [75, 0, 4],
  [102, 0, 5]
]

rings = [
  [25, 1, 0],
  [50, 2, 0],
  [100, 3, 0],
  [20, 0, 1],
  [40, 0, 2],
  [80, 0, 3]
]

def simulate(p_atk, p_def, spent, boss, result)
  p_life = 100
  b_life = boss[:boss_life]
  b_atk = boss[:boss_atk]
  b_def = boss[:boss_def]

  while true
    dmg = [p_atk - b_def, 1].max
    b_life -= dmg

    if b_life <= 0
      result[0] = [result[0], spent].min
      return
    end

    dmg = [b_atk - p_def, 1].max
    p_life -= dmg

    if p_life <= 0
      return
    end
  end
end

def search4(rings, p_atk, p_def, spent, boss, result)
  simulate(p_atk, p_def, spent, boss, result)

  rings.each do |ring|
    price, atk, defs = ring

    simulate(p_atk + atk, p_def + defs, spent + price, boss, result)
  end
end

def search3(rings, p_atk, p_def, spent, boss, result)
  search4(rings, p_atk, p_def, spent, boss, result)

  rings.each do |ring|
    price, atk, defs = ring

    search4(rings.reject { |r| r == ring }, p_atk + atk, p_def + defs, spent + price, boss, result)
  end
end

def search2(armors, rings, p_atk, p_def, spent, boss, result)
  search3(rings, p_atk, p_def, spent, boss, result)

  armors.each do |armor|
    price, atk, defs = armor

    search3(rings, p_atk + atk, p_def + defs, spent + price, boss, result)
  end
end

def search1(weapons, armors, rings, boss, result)
  weapons.each do |weapon|
    price, atk, defs = weapon

    search2(armors, rings, atk, defs, price, boss, result)
  end
end

result = [99999999]
search1(weapons, armors, rings, boss, result)
p result[0]

# problem 2

def simulate(p_atk, p_def, spent, boss, result)
  p_life = 100
  b_life = boss[:boss_life]
  b_atk = boss[:boss_atk]
  b_def = boss[:boss_def]

  while true
    dmg = [p_atk - b_def, 1].max
    b_life -= dmg

    if b_life <= 0
      return
    end

    dmg = [b_atk - p_def, 1].max
    p_life -= dmg

    if p_life <= 0
      result[0] = [result[0], spent].max
      return
    end
  end
end

result = [0]
search1(weapons, armors, rings, boss, result)
p result[0]
