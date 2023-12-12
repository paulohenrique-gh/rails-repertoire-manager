require 'rails_helper'

describe 'User registers period' do
  it 'and is not authenticated' do
    post periods_path(params: { period: { name: 'Clássico',
                                          start_year: 1730, end_year: 1820 } })

    expect(response).to redirect_to new_user_session_path
  end
end
