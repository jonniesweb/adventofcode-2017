class Day1
  def self.captcha(input)
    sum = 0
    input = input.to_s
    input.each_char.with_index do |c, index|
      if index == input.length - 1
        # compare ends
        sum += c.to_i if c == input[0]
      else
        # normal comparison
        sum += c.to_i if c == input[index+1]
      end
    end

    sum
  end
end
