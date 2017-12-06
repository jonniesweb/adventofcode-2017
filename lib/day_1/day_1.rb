class Day1
  def self.captcha(input)
    sum = 0
    input = input.to_s
    input.each_char.with_index do |c, index|
      sum += c.to_i if c == input[(index+1) % input.length]
    end

    sum
  end

  def self.captcha2(input)
    sum = 0
    input = input.to_s
    half = input.length / 2
    input.each_char.with_index do |c, index|
      sum += c.to_i if c == input[(half + index) % input.length]
    end

    sum
  end

end
