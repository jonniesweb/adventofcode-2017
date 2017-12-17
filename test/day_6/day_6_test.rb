require 'minitest/autorun'
require 'day_6/day_6'

class Day6Test < Minitest::Test
  def test_one
    input = "0 2 7 0"
    assert_equal 5, Day6.new(input).perform
  end

  def test_part_one
    assert_equal 4074, Day6.new(INPUT).perform
  end

  INPUT = "11	11	13	7	0	15	5	5	4	4	1	1	7	1	15	11"
end
