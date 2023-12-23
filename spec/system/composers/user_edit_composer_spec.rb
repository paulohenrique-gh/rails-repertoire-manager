require 'rails_helper'

describe 'User edits composer' do
  it 'successfully' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')
    period = Period.create!(name: 'Clássico', start_year: 1730, end_year: 1820,
                            user: user)
    composer = Composer.create!(name: 'Mozart', period: period, user: user)

    login_as user
    visit root_path
    click_on 'Compositores'
    click_on 'Mozart'
    click_on 'Editar'
    fill_in 'Nome', with: 'Beethoven'
    click_on 'Enviar'

    expect(page).to have_content 'Compositor atualizado com sucesso'
    expect(page).to have_content 'Beethoven'
    expect(composer.reload.name).to eq 'Beethoven'
  end

  it 'and leaves empty field' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')
    period = Period.create!(name: 'Clássico', start_year: 1730, end_year: 1820,
                            user: user)
    composer = Composer.create!(name: 'Mozart', period: period, user: user)

    login_as user
    visit edit_composer_path(composer)
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content 'Não foi possível atualizar compositor'
    expect(composer.reload.name).to eq 'Mozart'
  end
end
