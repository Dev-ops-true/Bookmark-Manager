feature 'return hello world' do
  scenario 'the page contains hello world' do
    visit('/')
    expect(page).to have_content('Bookmark Manager')
  end
end
