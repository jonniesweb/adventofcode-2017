class Day3
  attr_reader :num
  def initialize(num)
    @num = num
  end

  def steps
    return 0 if num == 1
    full_ring = total_at_ring(ring_number - 1)
    leftover_steps = num - full_ring

    ring_number + steps_to_middle(ring_number, leftover_steps) - 1
  end

  def ring_number
    position = inverse_total(num)
    ring_number = position.ceil
  end

  def steps_to_middle(ring_number, number)
    result = ring_number - 2

    direction = -1
    i = number - 1
    while i > 0 do
      if result == 0 || result == ring_number - 1
        direction *= -1
      end

      result += direction
      i -= 1
    end

    result
  end

  # private

  def total_at_ring(n)
    (n * 2 - 1) ** 2
  end

  def inverse_total(n)
    (1 + Math.sqrt(n)) / 2
  end

  def total_ring(n)
    8 * (n - 1)
  end

  def inverse_ring(n)
    n / 8 + 1
  end
end














class Day3p
  attr_reader :array
  def initialize
    @count = 0
    @array = Array.new(20, &proc { Array.new(20, 0) })
    @array[10][10] = 1

    @sum_count = 1
  end

  def get(num)
  end

  def populate(n)
    x = y = 0
    dir_seq = 0
    x_dir = [1, 0, -1, 0]
    y_dir = [0, -1, 0, 1]

    counter = 0
    while counter < 368078
      steps_to_take = count

      steps_to_take.times.each do |steps|

        counter += 1

        value = get(x, y)
        if value == 0
          counter = sum(x, y)
        end

        x += x_dir[dir_seq]
        y += y_dir[dir_seq]
      end
      dir_seq = (dir_seq + 1) % 4
    end

    # puts array.inspect
  end

  def sum(x, y)
    set(x, y,
      get(x-1, y-1) +
      get(x-1, y) +
      get(x-1, y+1) +
      get(x, y-1) +
      get(x, y+1) +
      get(x+1, y-1) +
      get(x+1, y) +
      get(x+1, y+1)
    )
  end

  def count
    s = @count += 0.5
    s.floor
  end

  def get(x, y)
    array[10 + x][10 + y]
  end

  def set(x, y, value)
    @sum_count += 1
    # puts "set: #{@sum_count} x: #{x} y: #{y} val: #{value}"
    array[10 + x][10 + y] = value
  end
end

# 17  16  15  14  13
# 18   5   4   3  12
# 19   6   1   2  11
# 20   7   8   9  10
# 21  22  23---> ...

# adjacent
# 1
#
# 2 1
# 3 1 2
# 4 1 2 3
# 5 1 4
# 6 1 2 5
# 7 1 6
# 8 1 2 6 7
# 9 1 7 8
#
# 10 1 8
# 11 1 2 8 9
# 12 1 9 10
# 13 1 10
# 14 1 2 10 11
# 15 1 10 11 12
# 16 1 11 12
# 17 1 13
# 18 1 2 12 13
# 19 1 12 13 14
# 20 1 13 14
# 21 1 14
# 22 1 2 14 15
# 23 1 14 15 16

# 1
# 2 3 4 5 6 7 8 9
# 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25

# ring count
# 1 1
# 2 8
# 3 16
# 4 24
# 5 32

# total ring count
# 1 1
# 2 9 8
# 3 25 24
# 4 49 48
# 5 81 80

# steps from origin
# 1 0   0

# 2 1   0
# 3 2   1
# 4 1   0
# 5 2   1
# 6 1   0
# 7 2   1
# 8 1   0
# 9 2   1

# 10 3  1
# 11 2  0
# 12 3  1
# 13 4  2
# 14 3  1
# 15 2  0
# 16 3  1
# 17 4  2
# 18 3  1
# 19 2  0
# 20 3  1
# 21 4  2
# 22 3  1
# 23 2  0
# 24 3  1
# 25 4  2

# number of steps to go before turning
# 0
# 1
# 1
# 2
# 2
# 3
# 3
# 4
# 4
# 5
