require 'rails_helper'

describe 'User views composer details page' do
  it 'from the home page' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')
    period = Period.create!(name: 'Clássico', start_year: 1730, end_year: 1820,
                            user: user)
    composer = Composer.create!(name: 'Beethoven', period: period,
                                notes: 'Compositor clássico', user: user)

    login_as user
    visit root_path
    click_on 'Compositores'
    click_on 'Beethoven'

    expect(page).to have_content 'Nome: Beethoven'
    expect(page).to have_content 'Período: Clássico'
    expect(page).to have_content 'Notas: Compositor clássico'
    expect(page).to have_link 'Editar'
    expect(page).to have_link 'Voltar'
  end
end
