# problem 1

def increment(chars, idx = 0)
  chars[idx] += 1

  if chars[idx] == 26
    chars[idx] = 0
    increment(chars, idx +1)
  end

  chars
end

def incr_str(str)
  str = str.reverse
  chrs = str.chars.map { |c| c.ord - 'a'.ord }

  chrs = increment(chrs)

  chrs.map { |o| (o + 'a'.ord).chr }.join.reverse
end

def password_test(str)
  if ['i', 'o', 'l'].any? { |c| str.include?(c) }
    return false
  end

  prev_c = nil
  prev_prev_c = nil
  rule_1_pass = false
  pair_prev_c = nil
  pairs = 0

  str.chars.each do |c|
    if prev_prev_c && prev_prev_c.ord == prev_c.ord - 1 && prev_prev_c.ord == c.ord - 2
      rule_1_pass = true
    end

    if pair_prev_c == c
      pairs += 1
      pair_prev_c = nil
    else
      pair_prev_c = c
    end

    prev_prev_c = prev_c
    prev_c = c
  end

  rule_1_pass && pairs >= 2
end

def search(str)
  str = incr_str(str)

  while true
    if password_test(str)
      return str
    end

    str = incr_str(str)
  end
end

s = search('cqjxjnds')
puts s

# problem 2

puts search(incr_str(s))
