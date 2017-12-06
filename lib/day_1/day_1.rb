class Day1
  attr_reader :num

  def initialize(num)
    @num = CircularArray.new(to_digit_array(num))
  end

  def captcha
    sum_selected do |digit, index|
      digit == digit_at(index)
    end
  end

  def captcha2
    sum_selected do |digit, index|
      digit == digit_at_half(index)
    end
  end

  private

  def sum_selected
    num.select.with_index do |digit, index|
      yield digit, index
    end
    .reduce(:+) || 0
  end

  def digit_at(index)
    num[next_digit_index(index)]
  end

  def digit_at_half(index)
    half = num.length / 2
    num[next_digit_index(index, half)]
  end

  def next_digit_index(index, offset = 1)
    index + offset
  end

  def to_digit_array(number)
    number.to_s.chars.map(&:to_i)
  end
end

class CircularArray < Array
  def [](i)
    super(i % length)
  end
end
