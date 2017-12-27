class Day9
  attr_reader :root_node
  def initialize(input)
    build_ast(input)
  end

  def build_ast(input)
    @root_node = current_node = Group.new(nil)
    garbage = false
    skip = false
    input[1..-1].each_char do |char|
      if skip
        skip = false
        next
      end

      case char
      when '{'
        next if garbage
        new_node = Group.new(current_node)
        current_node.children << new_node
        current_node = new_node
      when '}'
        next if garbage
        current_node = current_node.parent
      when '<'
        garbage = true
      when '>'
        garbage = false
      when '!'
        skip = true
      end
    end
  end

  def groups
    @root_node.count
  end

  def score
    @root_node.score(1)
  end
end

class Node
  attr_reader :parent
  def initialize(parent)
    @parent = parent
  end

  def inspect
    "#{self.class} children: #{children.count}"
  end
end

class Group < Node
  attr_reader :children
  def initialize(parent)
    super(parent)
    @children = []
  end

  def count
    return 1 if children.empty?
    1 + children.map(&:count).reduce(:+)
  end

  def score(n)
    return n if children.empty?
    n + children
    .map do |node|
      node.score(n + 1)
    end
    .reduce(:+)

  end
end
