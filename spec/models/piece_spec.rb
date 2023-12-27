require 'rails_helper'

RSpec.describe Piece, type: :model do
  context 'required fields' do
    describe '#valid?' do
      it 'returns false when title is empty' do
        user = User.create!(user_name: 'user', email: 'user@mail.com',
                            password: 'password')
        instrument = Instrument.create!(name: 'Violão', user: user)
        period = Period.create!(name: 'Romântico', start_year: 1810, end_year: 1890,
                                user: user)
        composer = Composer.create!(name: 'Dias Branco', period: period, user: user)

        piece = Piece.new(title: '', composer: composer, period: period,
                          start_date: 2.days.ago, finish_date: 1.day.ago, user: user)

        expect(piece).not_to be_valid
      end
    end
  end
end
