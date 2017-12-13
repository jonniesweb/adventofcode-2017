require 'minitest/autorun'
require 'day_3/day_3'

class Day3Test < Minitest::Test
  def test_one
    checks = [
      [1, 0],
      [12, 3],
      [23, 2],
      [1024, 31]
    ]

    checks.each do |check|
      assert_equal check[1], Day3.new(check[0]).steps
    end
  end

  # test that given a percentage of the current way through an array, the percentage picks the proper cell
  # number in ring from percentage
  def test_percentage_to_cell_position
    checks = [
      [16, 0.2320508075688772, 3],
      [16, 0.8979157616563596, 14]
    ]

    checks.each do |check|
      assert_equal check[2], Day3.percent_to_cell(check[0], check[1])
    end
  end

  def test_ring_number
    checks = [
      [1, 1],
      [2, 2],
      [3, 2],
      [9, 2],
      [10, 3]
    ]

    checks.each do |check|
      assert_equal check[1], Day3.new(check[0]).ring_number
    end
  end
end
