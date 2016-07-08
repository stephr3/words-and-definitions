require('rspec')
require('word')
require('definition')

describe(Word) do

  before() do
    Word.clear()
  end

  after() do
    Word.clear()
  end

  describe('#name') do
    it('returns the name of the word') do
      test_word = Word.new({:name => 'Cat'})
      expect(test_word.name()).to(eq('Cat'))
    end
  end

  describe('#save') do
    it('saves the word in an array') do
      test_word = Word.new({:name => 'Cat'})
      expect(test_word.save()).to(eq([test_word]))
    end
  end

  describe('.clear') do
    it('clears the array of words') do
      test_word = Word.new({:name => 'Cat'})
      test_word.save()
      expect(Word.clear()).to(eq([]))
    end
  end

  describe('.all') do
    it('returns an array of all saved words') do
      test_word = Word.new({:name => 'Cat'})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe('#id') do
    it('returns a unique id for a word') do
      test_word1 = Word.new({:name => 'Cat'})
      test_word1.save()
      test_word2 = Word.new({:name => 'Dog'})
      test_word2.save()
      expect(test_word2.id()).to(eq(2))
    end
  end

  describe('.find') do
    it('searches for and returns a word based on its unique id') do
      test_word1 = Word.new({:name => 'Cat'})
      test_word1.save()
      test_word2 = Word.new({:name => 'Dog'})
      test_word2.save()
      expect(Word.find(2)).to(eq(test_word2))
    end
  end

  describe('#add_definition') do
    it('adds a definition to the array of definitions for a word') do
      test_word = Word.new({:name => 'Cat'})
      test_word.save()
      test_definition = Definition.new({:part_of_speech => 'Noun', :definition => 'An animal with four legs, whiskers, and a tail.', :example_sentence => 'The cat meowed by the door all night.'})
      expect(test_word.add_definition(test_definition)).to(eq([test_definition]))
    end
  end
end
