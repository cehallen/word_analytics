require_relative 'spec_helper'

describe WordAnalysis do
  let(:string1) {"It's a beautiful day here in Banana Land.  Bananas everywhere are celebrating the election of their new leader Kim Jong Banana, the left wing upstart with a hairstyle to match."}
  let(:example1) {WordAnalysis.new(string1)}

  it '#word_occurrences counts words frequency' do
    expect(example1.word_occurrences).to include("banana" => 2)
    expect(example1.word_occurrences).to include("a" => 2)
    expect(example1.word_occurrences).to include("upstart" => 1)
  end

  it '#letter_occurrences counts letters frequency' do
    expect(example1.letter_occurrences).to include("k" => 1)
    expect(example1.letter_occurrences).to include("j" => 1)
    expect(example1.letter_occurrences).to include("a" => 20)
  end

  it '#symbol_occurrences counts non-letter, non-whitespace, symbol frequency' do
    expect(example1.symbol_occurrences).to include("." => 2)
    expect(example1.symbol_occurrences).to include("'" => 1)
  end

  it '#words_top_three lists top three most common words' do  # In case of ties, it only returns three words, choosing by alphabet order.. should improve this.
    expect(example1.words_top_three).to include("a - 2")
    expect(example1.words_top_three).to include("banana - 2")
    expect(example1.words_top_three).to include("the - 2")
    expect(example1.words_top_three).not_to include("left")
  end

  it '#letters_top_three lists top three most common letters' do
    expect(example1.letters_top_three).to include(". - 2")
  end
end












