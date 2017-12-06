class Day1
  attr_reader :num, :length

  def initialize(num)
    @num = to_digit_array(num)
    @length = @num.length
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
    num[modulo(index)]
  end

  def digit_at_half(index)
    half = length / 2
    num[modulo(index, half)]
  end

  def modulo(index, increment = 1)
    (index + increment) % length
  end

  def to_digit_array(number)
    number.to_s.chars.map(&:to_i)
  end
end
