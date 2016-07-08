require('rspec')
require('definition')

describe(Definition) do

  before() do
    Definition.clear()
  end

  after() do
    Definition.clear()
  end

  describe('#part_of_speech') do
    it('returns the part of speech of the definition') do
      test_definition = Definition.new({:part_of_speech => 'Noun', :definition_main => 'An animal with four legs, whiskers, and a tail.', :example_sentence => 'The cat meowed by the door all night.'})
      expect(test_definition.part_of_speech()).to(eq('Noun'))
    end
  end

  describe('#definition_main') do
    it('returns the definition') do
      test_definition = Definition.new({:part_of_speech => 'Noun', :definition_main => 'An animal with four legs, whiskers, and a tail.', :example_sentence => 'The cat meowed by the door all night.'})
      expect(test_definition.definition_main()).to(eq('An animal with four legs, whiskers, and a tail.'))
    end
  end

  describe('#example_sentence') do
    it('returns the example_sentence') do
      test_definition = Definition.new({:part_of_speech => 'Noun', :definition_main => 'An animal with four legs, whiskers, and a tail.', :example_sentence => 'The cat meowed by the door all night.'})
      expect(test_definition.example_sentence()).to(eq('The cat meowed by the door all night.'))
    end
  end

  describe('#save') do
    it('saves the definition in an array of definitions') do
      test_definition = Definition.new({:part_of_speech => 'Noun', :definition_main => 'An animal with four legs, whiskers, and a tail.', :example_sentence => 'The cat meowed by the door all night.'})
      expect(test_definition.save()).to(eq([test_definition]))
    end
  end

  describe('.clear') do
    it('clears the array of definitions') do
      test_definition = Definition.new({:part_of_speech => 'Noun', :definition_main => 'An animal with four legs, whiskers, and a tail.', :example_sentence => 'The cat meowed by the door all night.'})
      test_definition.save()
      expect(Definition.clear()).to(eq([]))
    end
  end

  describe('.all') do
    it('returns an array of all saved definitions') do
      test_definition = Definition.new({:part_of_speech => 'Noun', :definition_main => 'An animal with four legs, whiskers, and a tail.', :example_sentence => 'The cat meowed by the door all night.'})
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end

  describe('#id') do
    it('returns a unique id for a definition') do
      test_definition1 = Definition.new({:part_of_speech => 'Noun', :definition_main => 'An animal with four legs, whiskers, and a tail.', :example_sentence => 'The cat meowed by the door all night.'})
      test_definition1.save()
      test_definition2 = Definition.new({:part_of_speech => 'Noun', :definition_main => 'An unusually cool person.', :example_sentence => "The cool cat stood by the jazz club entrance, gazing through his dark sunglasses and giving a head nod to passersby."})
      test_definition2.save()
      expect(test_definition2.id()).to(eq(2))
    end
  end

  describe('.find') do
    it('searches for and returns a definition based on its unique id') do
      test_definition1 = Definition.new({:part_of_speech => 'Noun', :definition_main => 'An animal with four legs, whiskers, and a tail.', :example_sentence => 'The cat meowed by the door all night.'})
      test_definition1.save()
      test_definition2 = Definition.new({:part_of_speech => 'Noun', :definition_main => 'An unusually cool person.', :example_sentence => "The cool cat stood by the jazz club entrance, gazing through his dark sunglasses and giving a head nod to passersby."})
      test_definition2.save()
      expect(Definition.find(2)).to(eq(test_definition2))
    end
  end
end
