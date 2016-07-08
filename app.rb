require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')

get('/') do
  @words = Word.all()
  erb(:index)
end

get('/words/new') do
  erb(:word_form)
end

post('/words') do
  @name = params.fetch('name')
  @word = Word.new({:name => @name}).save()
  erb(:word_success)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/words/:id/definitions/new') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:definition_form)
end

post('words/:id/definitions') do
  part_of_speech = params.fetch('part-of-speech')
  definition = params.fetch('definition')
  example_sentence = params.fetch('example_sentence')
  @definition = Definition.new({:part_of_speech => part_of_speech, :definition => definition, :example_sentence => example_sentence}).save()
  @word = Word.find(params.fetch('id').to_i())
  @word.add_definition(@definition)
  erb(:definition_success)
end
