require 'rails_helper'

describe 'User edits period' do
  it 'and is not authenticated' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')
    period = Period.create!(name: 'Clássico', start_year: 1730, end_year: 1820,
                            user: user)

    patch period_path(period.id, params: { period: { name: 'Romântico' } })

    expect(response).to redirect_to new_user_session_path
  end

  it 'and is not the owner' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')
    other_user = User.create!(user_name: 'other', email: 'other@mail.com',
                              password: 'password')

    period = Period.create!(name: 'Clássico', start_year: 1730, end_year: 1820,
                            user: user)

    login_as other_user
    patch period_path(period.id, params: { period: { name: 'Romântico' } })

    expect(response).to redirect_to root_path
  end
end
