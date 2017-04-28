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
    expect(page).to have_content('PlayerOne')
  end

  scenario 'one_player' do
    srand(7)
    one_player
    expect(page).to have_content('The Rock')
  end
  
  scenario 'returns names & hit points' do
    sign_in_and_play
    expect(page).to have_content('PlayerOne 100HP')
  end

  scenario 'returns names & hit points' do
    sign_in_and_play
    expect(page).to have_content('PlayerTwo 100HP')
  end
end

feature 'Playing the game' do
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
    srand(111)
    click_button 'ATTACK'
    expect(page).to have_content('PlayerTwo got a slap in the face!')
  end

  scenario 'reports who got critical hit' do
    sign_in_and_play
    srand(123)
    click_button 'ATTACK'
    expect(page).to have_content('PlayerTwo GOT A DDT ON THE ARENA FLOOR!')
  end

  scenario 'reports who got healed' do
    sign_in_and_play
    srand(111)
    click_button 'HEAL'
    expect(page).to have_content('PlayerOne healed!')
  end

  scenario 'reports who got recovered' do
    sign_in_and_play
    srand(123)
    click_button 'HEAL'
    expect(page).to have_content('PlayerOne RECOVERED!')
  end

  scenario 'player one win' do
    sign_in_and_play
    play_full_game
    expect(page).to have_content('PLAYERONE IS THE NEW CHAMPION!')
  end
end
