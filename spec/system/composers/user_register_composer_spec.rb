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

  scenario 'successfully' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')
    user.periods.create!(name: 'Clássico', start_year: 1730, end_year: 1820)

    login_as user
    visit new_composer_path
    fill_in 'Nome', with: 'Ludwig Van Beethoven'
    select 'Clássico', from: 'Período'
    fill_in 'Notas', with: 'Compositor da Fur Elise'
    click_on 'Enviar'

    expect(current_path).to eq composers_path
    expect(page).to have_content 'Compositor cadastrado com sucesso'
    expect(page).to have_content 'Ludwig Van Beethoven'
    expect(user.composers.count).to eq 1
  end
end
