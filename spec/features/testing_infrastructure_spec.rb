feature 'Testing infrastructure' do

  scenario 'entering names' do
    visit('/')
    fill_in('player_one', with: 'Jeremy')
    fill_in('player_two', with: 'Adam')
    click_button('Submit')
    expect(page).to have_content('Jeremy vs Adam for the championship!')
  end
end
