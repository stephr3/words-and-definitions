require('pry')

class Definition
  @@definitions = []

  attr_reader(:part_of_speech, :definition, :example_sentence, :id)

  define_method(:initialize) do |attributes|
    @part_of_speech = attributes.fetch(:part_of_speech)
    @definition = attributes.fetch(:definition)
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

  define_singleton_method(:find) do |id_number|
    found_definition = nil
    @@definitions.each() do |definition|
      if definition.id().==(id_number.to_i())
        found_definition = definition
      end
    end
    found_definition
  end
end
