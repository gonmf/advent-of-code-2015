input = File.read('23.input').split("\n")

# problem 1

instructions = []

input.each do |line|
  code = line[0, 3]
  args = line[4, line.size].split(', ').map { |v| ['a', 'b'].include?(v) ? v : v.to_i }
  instructions.push([code, args])
end

def run_program(registers, instructions)
  idx = 0

  while true
    instruction = instructions[idx]
    break if instruction.nil?

    code, args = instruction

    if code == 'hlf'
      registers[args[0]] = (registers[args[0]] / 2).to_i
      idx += 1
      next
    end
    if code == 'tpl'
      registers[args[0]] *= 3
      idx += 1
      next
    end
    if code == 'inc'
      registers[args[0]] += 1
      idx += 1
      next
    end
    if code == 'jmp'
      idx += args[0]
      next
    end
    if code == 'jie'
      if (registers[args[0]] % 2) == 0
        idx += args[1]
      else
        idx += 1
      end
      next
    end
    if code == 'jio'
      if registers[args[0]] == 1
        idx += args[1]
      else
        idx += 1
      end
      next
    end

    break
  end

  registers['b']
end

p run_program({ 'a' => 0, 'b' => 0 }, instructions)

# program 2

p run_program({ 'a' => 1, 'b' => 0 }, instructions)
