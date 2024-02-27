require 'rails_helper'

describe 'User creates new account' do
  it 'successfully' do
    visit root_path
    click_on 'Cadastre-se'
    fill_in 'Nome de usuário', with: 'usuario1'
    fill_in 'E-mail', with: 'user@mail.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Criar conta'

    expect(page).to have_content 'Cadastro efetuado com sucesso'
    expect(Users.count).to eq 1
  end
end
