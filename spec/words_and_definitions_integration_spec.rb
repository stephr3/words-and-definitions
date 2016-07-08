require('capybara/rspec')
require('launchy')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add word path', {:type => :feature}) do
  it('allows user to add a word and confirm the word has been added') do
    visit('/')
    click_link('Add a Word')
    fill_in('name', :with => 'Cat')
    click_button('Add Word')
    expect(page).to have_content('Cat')
  end

  it('allows the user to view a list of words that the user has added') do
    visit('/')
    expect(page).to have_content('Cat')
  end
end

describe('the add a definition path', {:type => :feature}) do
  it('allows user to add a definition to a word and confirm the definition has been added') do
    visit('/')
    click_link('Cat')
    expect(page).to have_content('Cat')
    click_link('Add a Definition')
    expect(page).to have_content('Add a New Definition')
    fill_in('part-of-speech', :with => 'Noun')
    fill_in('definition', :with => 'An animal with four legs, whiskers, and a tail.')
    fill_in('example-sentence', :with => 'The cat meowed by the door all night.')
    click_button('Add Definition')
    expect(page).to have_content('The cat meowed by the door all night.')
  end
end
