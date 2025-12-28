input = File.read('18.input').split("\n")

# problem 1

matrix = {}

input.each.with_index do |line, y|
  line.split('').each.with_index do |v, x|
    matrix[y] ||= {}
    matrix[y][x] = true if v == '#'
  end
end

def count_neighbors(matrix, x, y)
  diffs = [[-1, -1], [1, -1], [-1, 1], [1, 1], [0, -1], [0, 1], [-1, 0], [1, 0]]

  count = 0

  diffs.each do |diff|
    diff_x, diff_y = diff

    new_x = x + diff_x
    new_y = y + diff_y

    count += 1 if matrix.dig(new_y, new_x) == true
  end

  count
end

(0...100).each do |step|
  next_matrix = {}

  (0...100).each do |x|
    (0...100).each do |y|
      nr_neighbors = count_neighbors(matrix, x, y)

      is_on = (matrix.dig(y, x) == true)

      if is_on
        if nr_neighbors == 2 || nr_neighbors == 3
          next_matrix[y] ||= {}
          next_matrix[y][x] = true
        end
      else
        if nr_neighbors == 3
          next_matrix[y] ||= {}
          next_matrix[y][x] = true
        end
      end
    end
  end

  matrix = next_matrix
end

p matrix.values.map { |v| v.size }.sum

# problem 2

matrix = {}

input.each.with_index do |line, y|
  line.split('').each.with_index do |v, x|
    matrix[y] ||= {}
    matrix[y][x] = true if v == '#'
  end
end

matrix[0] ||= {}
matrix[0][0] = true
matrix[0][99] = true
matrix[99] ||= {}
matrix[99][0] = true
matrix[99][99] = true

(0...100).each do |step|
  next_matrix = {}
  next_matrix[0] ||= {}
  next_matrix[0][0] = true
  next_matrix[0][99] = true
  next_matrix[99] ||= {}
  next_matrix[99][0] = true
  next_matrix[99][99] = true

  (0...100).each do |x|
    (0...100).each do |y|
      nr_neighbors = count_neighbors(matrix, x, y)

      is_on = (matrix.dig(y, x) == true)

      if is_on
        if nr_neighbors == 2 || nr_neighbors == 3
          next_matrix[y] ||= {}
          next_matrix[y][x] = true
        end
      else
        if nr_neighbors == 3
          next_matrix[y] ||= {}
          next_matrix[y][x] = true
        end
      end
    end
  end

  matrix = next_matrix
end

p matrix.values.map { |v| v.size }.sum
