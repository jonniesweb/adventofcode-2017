class Day3
  attr_reader :num
  def initialize(num)
    @num = num
  end

  def steps
    return 0 if num == 1

    position = inverse_total(num)
    ring_number = position.ceil

    percent_through_current_ring = position - position.floor

    puts "num: #{num} \nposition: #{position} \nring#: #{ring_number} \ncurrent ring percent: #{percent_through_current_ring}"

    position.ceil - 1

    steps_to_ring = ring_number - 1
    puts "steps to ring: #{steps_to_ring}"

    # cells_in_an_eighth = total_ring(ring_number) / 8
    # percent_of_an_eighth = percent_through_current_ring % 0.125
    # steps_to_mid = cells_in_an_eighth * percent_of_an_eighth

    # puts "cells in eighth: #{cells_in_an_eighth}"
    # puts "percent through eighth: #{percent_of_an_eighth}"
    # puts "steps to midpoint: #{steps_to_mid}"

    cells_in_ring = total_ring(ring_number)
    puts "cells in ring: #{cells_in_ring}"
    number_in_ring = cells_in_ring * percent_through_current_ring
    puts "number in ring: #{number_in_ring} #{number_in_ring.round}"
    puts "% size of cell: #{1.0 / cells_in_ring}"

    generated_cell_number = number_in_ring.ceil + total_ring(ring_number - 1)
    puts "maybe cell number? #{generated_cell_number}"
    raise 'cell number not the same' unless generated_cell_number == num

    cells_in_an_eighth = cells_in_ring / 8
    number_of_cells_taken = number_in_ring % cells_in_an_eighth
    puts "cells in eighth: #{cells_in_an_eighth}"
    puts "num of cells taken: #{number_of_cells_taken}"

    cells_in_an_eighth + 1


    # steps = steps to ring + steps to closest middle

    # steps to ring = ring_num - 1
    # cells_in_an_eighth = total_ring(n) / 8
    # percent_of_an_eighth = percent_through_current_ring % 0.125
    # steps_to_mid = cells_in_an_eighth * percent_of_an_eighth
    # steps = steps_to_ring + steps_to_mid
  end

  def self.percent_to_cell(total, percent)
    s= total * (percent - (1.0/total))
    s.ceil
  end

  def ring_number
    position = inverse_total(num)
    ring_number = position.ceil
  end

  private

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



# 17  16  15  14  13
# 18   5   4   3  12
# 19   6   1   2  11
# 20   7   8   9  10
# 21  22  23---> ...

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
# 1 0
# 2 1
# 3 2
# 4 1
# 5 2
# 6 1
# 7 2
# 8 1
# 9 2
# 10 3
# 11 2
# 12 3
# 13 4
# 14 3
# 15 2
# 16 3
# 17 4
# 18 3
# 19 2
# 20 3
# 21 4
# 22 3
# 23 2

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
