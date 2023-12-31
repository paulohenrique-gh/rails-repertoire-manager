require 'rails_helper'

describe 'User views instrument details page' do
  it 'from the home page' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')
    instrument = Instrument.create!(name: 'Guitarra', user: user)

    login_as user
    visit root_path
    click_on 'Instrumentos'
    click_on 'Guitarra'

    expect(page).to have_content 'Nome do instrumento: Guitarra'
    expect(page).to have_content(
      "Data de registro: #{I18n.localize(instrument.created_at.to_date)}"
    )
    expect(page).to have_content(
      "Data da última atualização: #{I18n.localize(instrument.updated_at.to_date)}"
    )
    expect(page).to have_link 'Editar'
  end

  it 'and is not authenticated' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')
    instrument = Instrument.create!(name: 'Guitarra', user: user)

    visit instrument_path(instrument)

    expect(current_path).to eq new_user_session_path
  end
end
