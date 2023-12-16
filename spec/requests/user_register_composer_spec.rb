require 'rails_helper'

describe 'User registers composer' do
  it 'and is not authenticated' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')
    period = Period.create!(name: 'Clássico', start_year: 1730, end_year: 1820,
                            user: user)

    post composers_path(params: { composer: { name: 'Mozart', period: period} })

    expect(response).to redirect_to new_user_session_path
  end
end
