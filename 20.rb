input = File.read('20.input')

goal = input.to_i

# problem 1

def house_presents(house_nr)
  v = 1
  root = Math.sqrt(house_nr)
  total = 0

  while v <= root
    if (house_nr % v) == 0
      total += v + house_nr / v
    end

    v += 1
  end

  total
end

goal1 = (goal / 10).ceil
house_nr = 1
while house_presents(house_nr) < goal1
  house_nr += 1
end
p house_nr

# problem 2

def house_presents(house_nr)
  v = 1
  root = Math.sqrt(house_nr)
  total = 0

  while v <= root
    if (house_nr % v) == 0
      times = house_nr / v
      total += v if v * 50 <= house_nr
      total += times if 50 >= v
    end

    v += 1
  end

  total
end

goal2 = (goal / 11).ceil
house_nr = 1
while house_presents(house_nr) < goal2
  house_nr += 1
end
p house_nr
