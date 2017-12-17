class Day5
  attr_reader :input
  def initialize(input)
    @input = input.split("\n").map(&:to_i)
   end

  def jump
    pointer = 0
    jumps = 0
    while input[pointer] != nil
      jumps += 1
      previous = input[pointer]
      input[pointer] += 1
      pointer += previous
    end
    jumps
  end
end
