require 'rails_helper'

RSpec.feature 'Create fake article', :js do
  background do
    #Capybara.current_driver = :chrome
    WebMock.disable_net_connect!(allow: [
      'content.guardianapis.com',
      'localhost',
      '127.0.0.1',
    ])
  end

  scenario 'with a valid topic' do
    visit root_path
    click_on 'New Fake News Source'

    fill_in 'fake_news_source_query', with: 'nuclear'
    click_on 'Save'

    expect(page).to have_content("There are no fake articles yet for this topic")

    click_on 'Generate new fake article'
    click_on 'Save'
    expect(page).to have_content("Fake article was successfully created.")

    find(".breadcrumb-item a", text: 'Fake News').click
    expect(page).to have_css("table td", text: 'nuclear')

    #10.times do
      #click_on 'nuclear'
      #click_on 'Show'
      #click_on 'Back'
      #click_on 'Fake News'
    #end
  end
end
