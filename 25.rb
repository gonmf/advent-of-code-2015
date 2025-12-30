# problem 1

input = File.read('25.input').split("\n")

goal_row = input[0].split('row ')[1].split(',')[0].to_i - 1
goal_col = input[0].split('column ')[1].split('.')[0].to_i - 1

input = File.read('25.input_2').split("\n")

value = input[2].split(' ')[2].to_i

row = 0
col = 0
max_row = 0

while true
  value = (value * 252533) % 33554393

  row = row - 1
  col = col + 1

  if row == -1
    max_row += 1
    row = max_row
    col = 0
  end

  if row == goal_row && col == goal_col
    puts value
    break
  end
end

