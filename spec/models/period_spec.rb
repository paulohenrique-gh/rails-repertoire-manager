require 'rails_helper'

RSpec.describe Period, type: :model do
  describe '#valid?' do
    it 'returns false when name is empty' do
      user = User.create!(user_name: 'user', email: 'user@mail.com',
                          password: 'password')
      period = Period.new(name: '', start_year: 1823, end_year: 1877,
                          user: user)

      expect(period).not_to be_valid
    end

    it 'returns false when start_year is empty' do
      user = User.create!(user_name: 'user', email: 'user@mail.com',
                          password: 'password')
      period = Period.new(name: 'Romantico', start_year: nil, end_year: 1877,
                          user: user)

      expect(period).not_to be_valid
    end

    it 'returns false when end_year is emtpy' do
      user = User.create!(user_name: 'user', email: 'user@mail.com',
                          password: 'password')
      period = Period.new(name: 'Romantico', start_year: 1823, end_year: nil,
                          user: user)

      expect(period).not_to be_valid
    end

    it 'returns true when all required fields are filled in' do
      user = User.create!(user_name: 'user', email: 'user@mail.com',
                          password: 'password')
      period = Period.new(name: 'Romantico', start_year: 1823, end_year: 1877,
                          user: user)

      expect(period).to be_valid
    end
  end
end
