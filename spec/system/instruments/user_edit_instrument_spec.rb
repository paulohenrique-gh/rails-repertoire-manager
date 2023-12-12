require 'rails_helper'

describe 'User edits registered instrument' do
  it 'from the home page' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')

    instrument = Instrument.create!(name: 'Pianio', user: user)

    login_as user
    visit root_path
    click_on 'Instrumentos'
    click_on 'Pianio'
    click_on 'Editar'
    fill_in 'Nome do instrumento', with: 'Piano'
    click_on 'Enviar'

    expect(current_path).to eq instruments_path
    expect(page).to have_content 'Instrumento atualizado com sucesso'
    expect(page).to have_content 'Piano'
  end

  it 'and leaves field empty' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')

    instrument = Instrument.create!(name: 'Piano', user: user)

    login_as user
    visit edit_instrument_path(instrument)
    fill_in 'Nome do instrumento', with: ''
    click_on 'Enviar'

    expect(page).to have_content 'Não foi possível atualizar instrumento'
    expect(instrument.name).to eq 'Piano'
  end

  it 'and is not authenticated' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')

    instrument = Instrument.create!(name: 'Piano', user: user)

    visit edit_instrument_path(instrument)

    expect(current_path).to eq new_user_session_path
  end
end
