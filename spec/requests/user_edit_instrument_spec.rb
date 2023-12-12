require 'rails_helper'

describe 'User edits instrument' do
  it 'and is not authenticated' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')
    instrument = Instrument.create!(name: 'Violão', user: user)

    patch instrument_path(instrument.id, params: { instrument: { name: 'Violino' } })

    expect(response).to redirect_to new_user_session_path
  end

  it 'and is not the owner' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                       password: 'password')
    other_user = User.create!(user_name: 'other', email: 'other@mail.com',
                              password: 'password')

    instrument = Instrument.create!(name: 'Violão', user: user)

    login_as other_user
    patch instrument_path(instrument.id, params: { instrument: { name: 'Violino' } })

    expect(response).to redirect_to root_path
    expect(instrument.name).to eq 'Violão'
  end
end
