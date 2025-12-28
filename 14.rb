# problem 1

input = File.read('14.input').split("\n")

reindeers = []

input.each do |line|
  name, _, _, speed, _, _, fly_time, _, _, _, _, _, _, rest_time = line.split('.')[0].split(' ')
  speed = speed.to_i
  fly_time = fly_time.to_i
  rest_time = rest_time.to_i

  reindeers.push({
    'name' => name,
    'speed' => speed,
    'fly_time' => fly_time,
    'rest_time' => rest_time,
  })
end

def distance_in_time(reindeer, time)
  full_cycles = (time / (reindeer['fly_time'] + reindeer['rest_time'])).to_i
  distance = full_cycles * reindeer['speed'] * reindeer['fly_time']
  time = time % (reindeer['fly_time'] + reindeer['rest_time'])
  distance + [time, reindeer['fly_time']].min * reindeer['speed']
end

p reindeers.map { |reindeer|  distance_in_time(reindeer, 2503) }.max

# problem 2

reindeers.each do |reindeer|
  reindeer['points'] = 0
  reindeer['distance'] = 0
  reindeer['fly_time_left'] = reindeer['fly_time']
  reindeer['rest_time_left'] = reindeer['rest_time']
end

time = 0

while time < 2503
  time += 1

  reindeers.each do |reindeer|
    if reindeer['fly_time_left'] > 0
      reindeer['fly_time_left'] -= 1
      reindeer['distance'] += reindeer['speed']
    else
      if reindeer['rest_time_left'] > 0
        reindeer['rest_time_left'] -= 1
      else
        reindeer['fly_time_left'] = reindeer['fly_time'] - 1
        reindeer['distance'] += reindeer['speed']
        reindeer['rest_time_left'] = reindeer['rest_time']
      end
    end
  end

  max_distance = reindeers.map { |reindeer| reindeer['distance'] }.max

  reindeers.each do |reindeer|
    reindeer['points'] += 1 if reindeer['distance'] == max_distance
  end
end

p reindeers.map { |r| r['points'] }.max
