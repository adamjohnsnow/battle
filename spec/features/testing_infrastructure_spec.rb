feature 'Testing infrastructure' do

  scenario 'entering names' do
    visit('/')
    fill_in('player_one', with: 'The Undertaker')
    fill_in('player_two', with: 'Daniel Bryan')
    click_button('Submit')
    expect(page).to have_content('The Undertaker vs Daniel Bryan for the World Heavyweight Championship!')
  end
  scenario 'Have HP' do
    visit('/')
    fill_in('player_one', with: 'The Undertaker')
    fill_in('player_two', with: 'Daniel Bryan')
    click_button('Submit')
    expect(page).to have_content('The Undertaker: 60HP')
  end
end
