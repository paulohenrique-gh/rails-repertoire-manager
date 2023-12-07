require 'rails_helper'

describe 'User registers new instrument' do
  it 'from the home page' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')

    login_as user
    visit root_path
    click_on 'Instrumentos'
    click_on 'Cadastrar novo instrumento'

    expect(page).to have_content 'Cadastro de instrumento'
    expect(page).to have_field 'Nome do instrumento'
    expect(page).to have_button 'Enviar'
  end

  it 'successfully' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')

    login_as user
    visit root_path
    click_on 'Instrumentos'
    click_on 'Cadastrar novo instrumento'
    fill_in 'Nome do instrumento', with: 'violão'
    click_on 'Enviar'

    expect(page).to have_content 'Instrumento cadastrado com sucesso'
    expect(page).to have_content 'Violão'
  end
end
