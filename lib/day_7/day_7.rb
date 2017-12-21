class Day7
  def initialize(input)
    @data = input.each_line.map do |line|
      items = line.split(/\W+/)
      name = items[0]
      number = items[1]
      children = items[2..-1]
      [name, Node.new(name, children)]
    end
    .to_h

    @data.each do |_, node|
      node.children.each do |child|
        @data[child].parent = node
      end
    end
  end

  def root
    node = @data.first[1]
    while node.parent
      node = node.parent
    end
    node.name
  end
end

class Node
  attr_reader :name, :children
  attr_accessor :parent
  def initialize(name, children)
    @name = name
    @children = children
  end
end
