require 'rails_helper'

describe 'User views period details' do
  it 'from the home page' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')
    period = Period.create!(name: 'Clássico', start_year: 1730, end_year: 1820,
                            notes: 'Período de Beethoven e Mozart', user: user)

    login_as user
    visit root_path
    click_on 'Períodos'
    click_on 'Clássico (1730 - 1820)'

    expect(page).to have_content 'Detalhes do período'
    expect(page).to have_content 'Período: Clássico'
    expect(page).to have_content 'Ano aproximado de início: 1730'
    expect(page).to have_content 'Ano aproximado de término: 1820'
    expect(page).to have_content 'Notas: Período de Beethoven e Mozart'
    expect(page).to have_content(
      "Data de registro: #{I18n.localize(period.created_at.to_date)}"
    )
    expect(page).to have_content(
      "Data da última atualização: #{I18n.localize(period.created_at.to_date)}"
    )
    expect(page).to have_link 'Editar'
  end
end
