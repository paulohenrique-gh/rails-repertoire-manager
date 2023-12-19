require 'rails_helper'

describe 'User edits composer' do
  it 'and is not authenticated' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')
    period = user.periods.create!(name: 'Clássico',
                                  start_year: 1730, end_year: 1820)
    composer = user.composers.create!(name: 'Beethoven', period: period)

    patch composer_path(composer.id, params: { composer: { name: 'Mozart' } })

    expect(response).to redirect_to new_user_session_path
    expect(composer.reload.name).to eq 'Beethoven'
  end

  it 'and is not the owner' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')
    other_user = User.create!(user_name: 'other', email: 'other@mail.com',
                              password: 'password')
    period = user.periods.create!(name: 'Clássico',
                                  start_year: 1730, end_year: 1820)
    composer = user.composers.create!(name: 'Beethoven', period: period)

    login_as other_user
    patch composer_path(composer.id, params: { composer: { name: 'Mozart'} })

    expect(response).to redirect_to root_path
    expect(composer.reload.name).to eq 'Beethoven'
  end
end
