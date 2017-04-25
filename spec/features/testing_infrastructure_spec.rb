feature 'Testing infrastructure' do
  scenario 'has contents' do
    visit('/')
    expect(page).to have_content('Testing infrastructure working!')
  end
end
