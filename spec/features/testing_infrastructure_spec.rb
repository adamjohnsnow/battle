feature 'Testing infrastructure' do

  scenario 'have submit button on homepage' do
    visit('/')
    expect(page).to have_button('Submit')
  end

  scenario 'have name field on homepage' do
    visit('/')
    expect(page).to have_field('player_1')
  end

  scenario 'entering player names' do
    sign_in_and_play
    expect(page).to have_content('Filipe vs Filipe
    for the Makers Academy Wrestling Championship!')
  end

  scenario 'players have HP' do
    sign_in_and_play
    expect(page).to have_content('Filipe 60HP')
  end
  
  scenario 'should return names & hit points' do
    sign_in_and_play
    expect(page).to have_content('Filipe 60HP vs. Filipe 60HP')
  end

end
