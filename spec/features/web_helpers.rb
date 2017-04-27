def sign_in_and_play
  visit('/')
  fill_in('player_1', with: 'PlayerOne')
  fill_in('player_2', with: 'PlayerTwo')
  click_button('Submit')
end

def play_full_game
  10.times do
    click_button 'ATTACK'
    click_button 'Next'
  end
  click_button 'ATTACK'
end
