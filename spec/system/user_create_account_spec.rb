require 'rails_helper'

describe 'User creates account' do
  it 'from the home page' do
    visit root_path
    click_on 'Sign up'

    expect(page).to have_field('Nome de usuário')
    expect(page).to have_field('E-mail')
    expect(page).to have_field('Senha')
    expect(page).to have_field('Confirme sua senha')
  end

  it 'successfully' do
    visit root_path
    click_on 'Sign up'

    fill_in 'Nome de usuário', with: 'new_user'
    fill_in 'E-mail', with: 'user@mail.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Sign up'

    expect(page).to have_content 'Você realizou seu registro com sucesso!'
  end
end
