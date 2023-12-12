require 'rails_helper'

describe 'User registers instrument' do
  it 'and is not authenticated' do
    post instruments_path(params: { instrument: { name: 'Violão' } })

    expect(response).to redirect_to new_user_session_path
  end
end
