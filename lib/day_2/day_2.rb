class Day2

  attr_reader :doc
  def initialize(doc)
    @doc = doc
  end

  def checksum
    doc.split("\n").map do |row|
        numbers = row.split(' ').map!(&:to_i)
        numbers.max - numbers.min
    end
    .reduce(:+)
  end

  def checksum2
    doc.split("\n").flat_map do |row|
      numbers = row.split(' ').map!(&:to_i)
      numbers.flat_map.with_index do |i, ii|
        numbers.map.with_index do |j, jj|
          next if ii == jj
          i / j if i % j == 0
        end
      end
    end
    .compact
    .reduce(:+)
  end
end
