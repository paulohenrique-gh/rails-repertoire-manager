require 'rails_helper'

RSpec.describe Period, type: :model do
  context 'required fields' do
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

  context 'other validations' do
    describe '#valid?' do
      it 'returns false when start_year is less than 1' do
        user = User.create!(user_name: 'user', email: 'user@mail.com',
                            password: 'password')
        period = Period.new(name: 'Clássico', start_year: -1950, end_year: 2000,
                            user: user)

        expect(period).not_to be_valid
      end

      it 'returns false when end_year is less start_year' do
        user = User.create!(user_name: 'user', email: 'user@mail.com',
                            password: 'password')
        period = Period.new(name: 'Clássico', start_year: 1820, end_year: 1730,
                            user: user)

        expect(period).not_to be_valid
      end
    end
  end

  context '#title_name' do
    it 'returns titleized string' do
      period = Period.new(name: 'período barroco')

      expect(period.title_name).to eq 'Período Barroco'
    end
  end
end
