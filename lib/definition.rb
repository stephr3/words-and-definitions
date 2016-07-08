require('pry')

class Definition
  @@definitions = []

  attr_reader(:part_of_speech, :definition, :example_sentence)

  define_method(:initialize) do |attributes|
    @part_of_speech = attributes.fetch(:part_of_speech)
    @definition = attributes.fetch(:definition)
    @example_sentence = attributes.fetch(:example_sentence)
    @id = @@definitions.length().+(1)
  end

  define_method(:save) do
    @@definitions.push(self)
  end
end
