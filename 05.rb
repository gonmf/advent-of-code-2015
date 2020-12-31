# problem 1

def nice_string?(s)
  prev_c = nil
  found_in_a_row = false
  vowels_count = 0

  s.chars.each do |c|
    return false if %w[ab cd pq xy].include?("#{prev_c}#{c}")

    if c == prev_c
      found_in_a_row = true
    end

    if %w[a e i o u].include?(c)
      vowels_count += 1
    end

    prev_c = c
  end

  vowels_count >= 3 && found_in_a_row
end

input = File.read('05.input').split("\n")

count = 0

input.each do |line|
  count += 1 if nice_string?(line)
end

puts count

# problem 2

def count_non_overlapping_occurrences(s, pair)
  s = s.gsub(pair, "<#{pair}>")

  s.count('<')
end

def nice_string?(s)
  pairs = []
  s.chars.each_slice(2) do |sl1, sl2|
    pairs.push("#{sl1}#{sl2}") if sl2
  end
  s[1..-1].chars.each_slice(2) do |sl1, sl2|
    pairs.push("#{sl1}#{sl2}") if sl2
  end

  pairs = pairs.uniq
  pair_found = false

  pairs.each do |pair|
    if count_non_overlapping_occurrences(s, pair) >= 2
      pair_found = true
      break
    end
  end

  return false unless pair_found

  prev_prev_c = nil
  prev_c = nil
  s.chars.each do |c|
    if c == prev_prev_c
      return true
    end

    prev_prev_c = prev_c
    prev_c = c
  end

  false
end

count = 0

input.each do |line|
  count += 1 if nice_string?(line)
end

puts count
