require 'rails_helper'

describe 'User visits instruments index page' do
  it 'from the home page' do
    user = User.create!(user_name: 'user', email: 'mail@user.com',
                        password: 'password')

    instrument = Instrument.create!(name: 'Violão', user: user)
    instrument_two = Instrument.create!(name: 'Guitarra', user: user)
    instrument_three = Instrument.create!(name: 'Piano', user: user)

    login_as user
    visit root_path
    click_on 'Instrumentos'

    expect(page).to have_content 'Violão'
    expect(page).to have_content 'Guitarra'
    expect(page).to have_content 'Piano'
  end

  it 'and there is no registered instruments' do
    user = User.create!(user_name: 'user', email: 'mail@user.com',
                        password: 'password')

    login_as user
    visit root_path
    click_on 'Instrumentos'

    expect(page).to have_content 'Nenhum instrumento cadastrado'
  end

  it 'and is not authenticated' do
    visit instruments_path

    expect(current_path).to eq new_user_session_path
  end
end
