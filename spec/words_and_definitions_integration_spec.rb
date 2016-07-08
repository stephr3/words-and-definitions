require('capybara/rspec')
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
    click_link('Add a Word')
    fill_in('name', :with => 'Cat')
    click_button('Add Word')
    click_link('Home')
    expect(page).to have_content('Cat')
  end
end
