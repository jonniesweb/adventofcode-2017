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
      break if memory_duplicate(history, count) > 1
    end
    count
  end

  def perform2
    count = 0
    history = {}

    while true do
      count += 1
      biggest = find_biggest
      redistribute(biggest)
      value = memory_duplicate(history, count)
      break if value > 1
    end
    count - history[memory][:start]
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

  def memory_duplicate(history, count)
    history[memory] ? history[memory][:count] += 1 : history[memory] = { count: 1, start: count}
    return history[memory][:count]
  end
end
