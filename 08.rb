# problem 1

input = File.read('08.input').split("\n")

nr_code_chars = 0
nr_memory_chars = 0

input.each do |line|
  nr_code_chars += line.size
  nr_memory_chars += eval("#{line}.size")
end

puts nr_code_chars - nr_memory_chars

# problem 2

nr_code_chars = 0
nr_memory_chars = 0

input.each do |line|
  next if line.size == 0

  nr_code_chars += line.size

  nr_memory_chars += 2 + line.size
  line.chars.each do |c|
    if c == '"' || c == '\\'
      nr_memory_chars += 1
    end
  end
end

puts nr_memory_chars - nr_code_chars
