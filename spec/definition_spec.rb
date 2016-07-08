require('rspec')
require('definition')

describe(Definition) do

  before() do
    Definition.clear()
  end
  
  describe('#part_of_speech') do
    it('returns the part of speech of the definition') do
      test_definition = Definition.new({:part_of_speech => 'Noun', :definition => 'An animal with four legs, whiskers, and a tail.', :example_sentence => 'The cat meowed by the door all night.'})
      expect(test_definition.part_of_speech()).to(eq('Noun'))
    end
  end

  describe('#definition') do
    it('returns the definition') do
      test_definition = Definition.new({:part_of_speech => 'Noun', :definition => 'An animal with four legs, whiskers, and a tail.', :example_sentence => 'The cat meowed by the door all night.'})
      expect(test_definition.definition()).to(eq('An animal with four legs, whiskers, and a tail.'))
    end
  end

  describe('#example_sentence') do
    it('returns the example_sentence') do
      test_definition = Definition.new({:part_of_speech => 'Noun', :definition => 'An animal with four legs, whiskers, and a tail.', :example_sentence => 'The cat meowed by the door all night.'})
      expect(test_definition.example_sentence()).to(eq('The cat meowed by the door all night.'))
    end
  end

  describe('#save') do
    it('saves the definition in an array of definitions') do
      test_definition = Definition.new({:part_of_speech => 'Noun', :definition => 'An animal with four legs, whiskers, and a tail.', :example_sentence => 'The cat meowed by the door all night.'})
      expect(test_definition.save()).to(eq([test_definition]))
    end
  end

  describe('.clear') do
    it('clears the array of definitions') do
      test_definition = Definition.new({:part_of_speech => 'Noun', :definition => 'An animal with four legs, whiskers, and a tail.', :example_sentence => 'The cat meowed by the door all night.'})
      test_definition.save()
      expect(Definition.clear()).to(eq([]))
    end
  end

end
