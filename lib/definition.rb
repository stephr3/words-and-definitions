require('pry')

class Definition
  @@definitions = []

  attr_reader(:part_of_speech, :definition_main, :example_sentence, :id)

  define_method(:initialize) do |attributes|
    @part_of_speech = attributes.fetch(:part_of_speech)
    @definition_main = attributes.fetch(:definition_main)
    @example_sentence = attributes.fetch(:example_sentence)
    @id = @@definitions.length().+(1)
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_singleton_method(:all) do
    @@definitions
  end
end
