class Day4
  def initialize(pass)
    @pass = pass.split(' ')
  end

  def passphrase
    @pass.each_with_object(Hash.new(0)) do |word, hash|
      hash[word] += 1
      return false if hash[word] > 1
    end
    true
  end

  def passphrase2
    @pass.each_with_object(Hash.new(0)) do |word, hash|
      word = word.chars.sort.join
      hash[word] += 1
      return false if hash[word] > 1
    end
    true
  end
end
