require 'rails_helper'

feature 'User registers composer' do
  scenario 'from the home page' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')

    login_as user
    visit root_path
    click_on 'Compositores'
    click_on 'Cadastrar novo compositor'

    expect(page).to have_content 'Cadastro de compositor'
    expect(page).to have_content 'Nome'
    expect(page).to have_content 'Período'
    expect(page).to have_content 'Notas'
    expect(page).to have_button 'Enviar'
  end
end
