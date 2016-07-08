require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add word path', {:type => :feature}) do
  it('allows user to add a word and confirm the word has been added') do
    visit('/')
    click_button('add-word-form')
    fill_in('name', :with => 'Cat')
    click_button('add-word')
    expect(page).to have_content('Congratulations!')
  end
end
