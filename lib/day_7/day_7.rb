class Day7
  def initialize(input)
    @data = input.each_line.map do |line|
      items = line.split(/\W+/)
      name = items[0]
      weight = items[1].to_i
      children = items[2..-1]
      [name, Node.new(name, weight, children)]
    end
    .to_h

    @data.values.each do |node|
      node.children.map! do |node|
        @data[node]
      end
      node.children.each do |child|
        child.parent = node
      end
    end
  end

  def root
    node = @data.first[1]
    while node.parent
      node = node.parent
    end
    node
  end

  # From the root node, recursively iterate to the child node that has a
  # different sum than the other child nodes.
  def wrong_weight
    iterate(root)
  end

  def iterate(node)
    ordered_by_count = group_by_count(node.children)
    if ordered_by_count.size > 1
      unbalanced_child = ordered_by_count.first[1][0]

      iterate(unbalanced_child)
    else
      grouped_nodes = group_by_count(node.parent.children)
      diff = grouped_nodes[0].first - grouped_nodes[1].first

      node.weight - diff
    end
  end

  def group_by_count(nodes)
    grouped = nodes.group_by(&:sum)
    ordered_by_count = grouped.sort_by{ |sum, values| values.count }
  end
end

class Node
  attr_reader :name, :children, :weight
  attr_accessor :parent
  def initialize(name, weight, children)
    @name = name
    @weight = weight
    @children = children
  end

  def sum
    weight + children.map(&:sum).reduce(:+).to_i
  end

  def inspect
    "#{name}, #{children.map(&:name)}, #{weight}, #{sum}"
  end
end
