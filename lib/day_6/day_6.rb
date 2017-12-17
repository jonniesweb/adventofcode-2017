class Day6
  attr_reader :memory
  def initialize(memory)
    @memory = memory.split(' ').map(&:to_i)
  end

  def perform
    count = 0
    history = {}

    while true do
      count += 1
      biggest = find_biggest
      redistribute(biggest)
      break if memory_duplicate?(history)
    end
    count
  end

  private

  def find_biggest
    memory.index(memory.max)
  end

  def redistribute(index)
    value = memory[index]
    memory[index] = 0
    value.times do |n|
      position = (index + n + 1) % memory.size
      memory[position] += 1
    end
  end

  def memory_duplicate?(history)
    result = memory.join(' ')
    return true if history[result]
    history[result] = 1
    false
  end
end
