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
      if garbage
        current_node.garbage += 1
      end

      if skip
        skip = false
        current_node.garbage -= 1 if garbage
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
        if garbage
          garbage = false
          current_node.garbage -= 1
        end
      when '!'
        skip = true
        current_node.garbage -= 1
      end
    end
  end

  def groups
    root_node.count
  end

  def score
    root_node.score(1)
  end

  def garbage_count
    root_node.garbage_count
  end
end

class Group
  attr_reader :parent, :children
  attr_accessor :garbage
  def initialize(parent)
    @parent = parent
    @children = []
    @garbage = 0
  end

  def to_s
    "#{self.class} children: #{children.count}"
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

  def garbage_count
    return garbage if children.empty?
    garbage + children
    .map(&:garbage_count)
    .reduce(:+)
  end
end
