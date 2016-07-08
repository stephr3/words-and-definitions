require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add word path', {:type => :feature}) do
  it('allows user to add a word and confirm the word has been added') do
    visit('/')
    click_link('Add a Word')
    expect(page).to have_content('Add a New Word')
    fill_in('name', :with => 'Cat')
    click_button('Add Word')
    expect(page).to have_content('Cat')
  end
end
