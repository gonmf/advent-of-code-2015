# problem 1

input = File.read('13.input').split("\n")

rules = []

input.each do |line|
  personA, _, effect, amount, _, _, _, _, _, _, personB = line.split('.')[0].split(' ')
  amount = amount.to_i
  amount = -amount if effect == 'lose'

  rules.push({
    'personA' => personA,
    'amount' => amount,
    'personB' => personB,
  })
end

persons = rules.map { |r| [r['personA'], r['personB']] }.flatten.uniq.sort

def score_seats(seats, rules)
  score = 0

  seats.each.with_index do |seat_person, seat_idx|
    neighbors = [seats[(seat_idx - 1) % seats.size], seats[(seat_idx + 1) % seats.size]]

    rules.each do |rule|
      if rule['personA'] == seat_person
        if neighbors.include?(rule['personB'])
          score += rule['amount']
        end
      end
    end
  end

  score
end

def search(seats, seat_nr, persons, rules, result)
  if seat_nr == seats.size
    result[0] = [result[0], score_seats(seats, rules)].max
    return
  end

  persons.each do |person|
    new_seats = seats.dup
    new_seats[seat_nr] = person
    new_persons = persons.reject { |pr| pr == person }
    search(new_seats, seat_nr + 1, new_persons, rules, result)
  end
end

initial = Array.new(persons.size)
initial[0] = rules[0]['personA']

result = [-999999]
search(initial, 1, persons[1..persons.size], rules, result)
p result[0]

# problem 2

persons.push('self')

initial = Array.new(persons.size)
initial[0] = rules[0]['personA']

result = [-999999]
search(initial, 1, persons[1..persons.size], rules, result)
p result[0]
