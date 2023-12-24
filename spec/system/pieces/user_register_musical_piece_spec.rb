require 'rails_helper'

feature 'User register musical piece' do
  scenario 'from the home page' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')

    login_as user
    visit root_path
    click_on 'Músicas'
    click_on 'Cadastrar nova música'

    expect(page).to have_content 'Cadastro de música'
    expect(page).to have_field 'Título'
    expect(page).to have_field 'Opus'
    expect(page).to have_field 'Número'
    expect(page).to have_field 'Movimento'
    expect(page).to have_field 'Outros identificadores'
    expect(page).to have_field 'Compositor'
    expect(page).to have_field 'Período'
    expect(page).to have_field 'Data inicial'
    expect(page).to have_field 'Data final'
    expect(page).to have_field 'Instrumento'
    expect(page).to have_field 'Nível de dificuldade'
    expect(page).to have_button 'Enviar'
  end
end
