

feature 'adding a bookmark' do
  scenario 'it should add a bookmark to the database' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.facebook.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    expect(page).to have_link('Test Bookmark', href: 'http://www.facebook.com')
  end
end
