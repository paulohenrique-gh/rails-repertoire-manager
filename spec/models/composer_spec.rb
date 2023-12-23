require 'rails_helper'

RSpec.describe Composer, type: :model do
  context '#valid?' do
    it 'returns false with empty name' do
      user = User.create!(user_name: 'user', email: 'user@mail.com',
                          password: 'password')
      period = Period.create!(name: 'Clássico', start_year: 1730, end_year: 1820,
                              user: user)
      composer = Composer.new(name: '', user: user, period: period)

      expect(composer).not_to be_valid
    end

    it 'returns true when name is given' do
      user = User.create!(user_name: 'user', email: 'user@mail.com',
                          password: 'password')
      period = Period.create!(name: 'Clássico', start_year: 1730, end_year: 1820,
                              user: user)
      composer = Composer.new(name: 'Beethoven', user: user, period: period)

      expect(composer).to be_valid
    end
  end
end
