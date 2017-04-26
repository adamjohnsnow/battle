def sign_in_and_play
  visit('/')
  fill_in('player_1', with: 'Filipe')
  fill_in('player_2', with: 'Filipe')
  click_button('Submit')
end
