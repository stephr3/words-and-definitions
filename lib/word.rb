require('pry')

class Word
  @@words = []

  attr_reader(:word, :definitions, :id)

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @definitions = []
    @id = @@words.length().+(1)
  end
end
