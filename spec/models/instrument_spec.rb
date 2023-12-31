require 'rails_helper'

RSpec.describe Instrument, type: :model do
  context '#valid?' do
    it 'returns false when name is empty' do
      user = User.create!(user_name: 'user', email: 'user@mail.com',
                          password: 'password')
      instrument = Instrument.new(name: '', user: user)

      expect(instrument).not_to be_valid
    end

    it 'returns true when name is given' do
      user = User.create!(user_name: 'user', email: 'user@mail.com',
                          password: 'password')
      instrument = Instrument.new(name: 'Piano', user: user)

      expect(instrument).to be_valid
    end
  end

  context '#title_name' do
    it 'returns titleized string' do
      instrument = Instrument.new(name: 'piano de cauda')

      expect(instrument.title_name).to eq 'Piano De Cauda'
    end
  end
end
