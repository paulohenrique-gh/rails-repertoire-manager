require 'rails_helper'

describe 'User edits period' do
  it 'successfully' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')
    user.periods.create!(name: 'Clássico', start_year: 1730, end_year: 1820)

    login_as user
    visit root_path
    click_on 'Períodos'
    click_on 'Clássico'
    click_on 'Editar'
    fill_in 'Nome do período', with: 'Romântico'
    fill_in 'Ano aproximado de início', with: 1820
    fill_in 'Ano aproximado de término', with: 1890
    click_on 'Enviar'

    expect(current_path).to eq periods_path
    expect(page).to have_content 'Período atualizado com sucesso'
    expect(page).to have_content 'Romântico (1820 - 1890)'
  end

  it 'and leaves required fields empty' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')
    period = Period.create!(name: 'Clássico', start_year: 1730, end_year: 1820,
                            user: user)

    login_as user
    visit edit_period_path(period)
    fill_in 'Nome do período', with: ''
    click_on 'Enviar'

    expect(page).to have_content 'Não foi possível atualizar período'
    expect(period.name).to eq 'Clássico'
  end

  it 'and is not authenticated' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')
    period = Period.create!(name: 'Clássico', start_year: 1730, end_year: 1820,
                            user: user)

    visit edit_period_path(period)

    expect(current_path).to eq new_user_session_path
  end
end
