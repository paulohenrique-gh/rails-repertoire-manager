require 'rails_helper'

describe 'User registers musical period' do
  it 'from the home page' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')

    login_as user
    visit root_path
    click_on 'Períodos'
    click_on 'Cadastrar novo período'

    expect(page).to have_field 'Nome do período'
    expect(page).to have_field 'Ano aproximado de início'
    expect(page).to have_field 'Ano aproximado de término'
    expect(page).to have_field 'Notas'
    expect(page).to have_button 'Enviar'
  end

  it 'successfully' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')

    login_as user
    visit root_path
    click_on 'Períodos'
    click_on 'Cadastrar novo período'
    fill_in 'Nome do período', with: 'Clássico'
    fill_in 'Ano aproximado de início', with: '1730'
    fill_in 'Ano aproximado de término', with: '1820'
    fill_in 'Notas', with: 'Período de Mozart e Beethoven'
    click_on 'Enviar'

    expect(current_path).to eq periods_path
    expect(page).to have_content 'Período cadastrado com sucesso'
    expect(page).to have_content 'Clássico (1730 - 1820)'
  end
end
