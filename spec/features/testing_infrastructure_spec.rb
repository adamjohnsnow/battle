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
    expect(page).to have_content('PlayerOne vs PlayerTwo
    for the Makers Academy Wrestling Championship!')
  end
end

feature 'Playing the game' do
  scenario 'returns names & hit points' do
    sign_in_and_play
    expect(page).to have_content('PlayerOne 60HP vs. PlayerTwo 60HP')
  end

  scenario 'starts with p1 turn' do
    sign_in_and_play
    expect(page).to have_content('PlayerOne\'s turn')
  end

  scenario 'switches to p2 turn' do
    sign_in_and_play
    click_button 'ATTACK'
    click_button 'Next'
    expect(page).to have_content('PlayerTwo\'s turn')
  end

  scenario 'reports who got hit' do
    sign_in_and_play
    click_button 'ATTACK'
    expect(page).to have_content('PlayerTwo got hit!')
  end
end
