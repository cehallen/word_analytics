
class WordAnalysis
  def initialize(string)
    @string = string.downcase
  end

  def word_occurrences
    counts = {}
    @string.gsub(/[^a-z\s]/, '').split.each do |word|
      if !counts.keys.include?(word)
        counts[word] = 1
      else
        counts[word] += 1
      end
    end
    counts
  end

  def letter_occurrences
    counts = {}
    @string.gsub(/[^a-z]/, '').split(//).each do |letter|
      if !counts.keys.include?(letter)
        counts[letter] = 1
      else
        counts[letter] += 1
      end
    end
    counts
  end

  def symbol_occurrences
    counts = {}
    @string.gsub(/[a-z\s]/, '').split(//).each do |symbol|
      if !counts.keys.include?(symbol)
        counts[symbol] = 1
      else
        counts[symbol] += 1
      end
    end
    counts
  end

  def words_top_three
    counts_hash = self.word_occurrences
    counts_hash = counts_hash.sort_by{|k,v| v}.reverse
    top_three = counts_hash[0..2]
    top_three_string = ""
    top_three.each do |pair|
      top_three_string << "#{pair.join(" - ")}\n"
    end
    top_three_string
  end

  def letters_top_three  #so complicated bc I wanted to get all values of the top three frequencies, not just three. So if there were 15 values tied for 3rd, they would all show up too.  Should refactor I know.
    counts_hash = self.letter_occurrences
    top_values = []

    counts_hash.sort_by{|k, v| v}.reverse[0..2].each do |pair|
      top_values << pair[1]
    end
    top_pairs = counts_hash.select{|k, v| v == top_values[0] || v == top_values[1] || v == top_values[2]}.sort_by{|k,v| v}.reverse
    top_pairs_string = ""
    top_pairs.each do |pair|
      top_pairs_string << "#{pair.join" - "}\n"
    end

    top_pairs_string
  end

end












