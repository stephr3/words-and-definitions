require('rspec')
require('definition')

describe(Definition) do
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
end
