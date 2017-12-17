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

  def test_steps_to_middle
    checks = [
      [2, 1, 0],
      [2, 2, 1],
      [2, 3, 0],
      [2, 4, 1],
      [2, 5, 0],
      [2, 6, 1],
      [2, 7, 0],
      [2, 8, 1],

      [3, 1, 1],
      [3, 2, 0],
      [3, 3, 1],
      [3, 4, 2],
      [3, 5, 1],
      [3, 6, 0],
      [3, 7, 1],
      [3, 8, 2],
      [3, 9, 1],
      [3, 10, 0],

      [4, 1, 2]

    ]

    checks.each do |check|
      assert_equal check[2], Day3.new(check[0]).steps_to_middle(check[0], check[1])
    end
  end

  def test_part_1
    assert_equal 371, Day3.new(368078).steps
  end

  def test_two
    # checks = %w(
    #   1
    #   1
    #   2
    #   4
    #   5
    #   10
    #   11
    #   23
    #   25
    #   26
    #   54
    #   57
    #   59
    #   122
    #   133
    #   142
    #   147
    #   304
    #   330
    #   351
    #   362
    #   747
    #   806
    # ).map!(&:to_i)
    # s = Day3p.new
    # checks.each.with_index do |n, index|
    #   assert_equal n, s.populate(index)
    # end
    Day3p.new.populate(30)
  end
end
