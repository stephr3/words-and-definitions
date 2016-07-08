require('rspec')
require('word')
require('definition')

describe(Word) do
  describe('#word') do
    it('returns the word') do
      test_word = Word.new({:word => 'Cat'})
      expect(test_word.word()).to(eq('Cat'))
    end
  end

  describe('#save') do
    it('saves the word in an array') do
      test_word = Word.new({:word => 'Cat'})
      expect(test_word.save()).to(eq([test_word]))
    end
  end

  describe('.clear') do
    it('clears the array of words') do
      test_word = Word.new({:word => 'Cat'})
      test_word.save()
      expect(Word.clear()).to(eq([]))      
    end
  end
end
