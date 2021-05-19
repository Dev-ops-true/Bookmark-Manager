require_relative 'web_helper'

feature 'viewing all bookmarks' do
  scenario 'page displays all bookmarks' do
    populate_database
    visit('/bookmarks')
    expect(page).to have_content('http://www.twitter.com')
    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.google.com')
  end
end

feature 'adding a bookmark' do
    scenario 'it should add a bookmark to the database' do
        visit('/bookmarks/new')
        fill_in('url', with: 'http://www.facebook.com')
        click_button('Submit')
        expect(page).to have_content('http://www.facebook.com')
    end
end
