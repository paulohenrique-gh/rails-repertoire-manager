require 'rails_helper'

describe 'User signs in' do
  it 'successfully' do
    user = User.create!(user_name: 'music_nerd', email: 'user@mail.com',
                        password: 'password')

    visit root_path
    fill_in 'E-mail', with: 'user@mail.com'
    fill_in 'Senha', with: 'password'
    within '.actions' do
      click_on 'Log in'
    end

    expect(current_path).to eq root_path
    expect(page).to have_content 'music_nerd'
    expect(page).to have_button 'Sair'
  end

  it 'and gives wrong credentials' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')

    visit root_path
    fill_in 'E-mail', with: 'user@mail.com'
    fill_in 'Senha', with: 'senhasecreta'
    click_on 'Log in'

    expect(page).to have_content 'E-mail ou senha inválidos.'
  end
end
