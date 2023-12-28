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

        piece = Piece.new(title: '', composer: composer, period: period, instrument: instrument,
                          start_date: 2.days.ago, finish_date: 1.day.ago, user: user)

        expect(piece).not_to be_valid
      end

      it 'returns false when start_date is empty' do
        user = User.create!(user_name: 'user', email: 'user@mail.com',
                            password: 'password')
        instrument = Instrument.create!(name: 'Violão', user: user)
        period = Period.create!(name: 'Romântico', start_year: 1810, end_year: 1890,
                                user: user)
        composer = Composer.create!(name: 'Dias Branco', period: period, user: user)

        piece = Piece.new(title: 'Etude 12', composer: composer, period: period,
                          instrument: instrument, start_date: '', user: user)

        expect(piece).not_to be_valid
      end
    end
  end

  context 'numericality' do
    describe '#valid?' do
      it 'returns false when difficulty level is less than 1' do
        user = User.create!(user_name: 'user', email: 'user@mail.com',
                            password: 'password')
        instrument = Instrument.create!(name: 'Violão', user: user)
        period = Period.create!(name: 'Romântico', start_year: 1810, end_year: 1890,
                                user: user)
        composer = Composer.create!(name: 'Dias Branco', period: period, user: user)

        piece = Piece.new(title: 'Etude', composer: composer, period: period,
                          instrument: instrument, start_date: 1.day.ago,
                          difficulty_level: -1, user: user)

        expect(piece).not_to be_valid
        expect(piece.errors.messages.keys).to include :difficulty_level
      end

      it 'returns false when difficulty level is greater than 10' do
        user = User.create!(user_name: 'user', email: 'user@mail.com',
                            password: 'password')
        instrument = Instrument.create!(name: 'Violão', user: user)
        period = Period.create!(name: 'Romântico', start_year: 1810, end_year: 1890,
                                user: user)
        composer = Composer.create!(name: 'Dias Branco', period: period, user: user)

        piece = Piece.new(title: 'Etude', composer: composer, period: period,
                          instrument: instrument, start_date: 1.day.ago,
                          difficulty_level: 12, user: user)

        expect(piece).not_to be_valid
        expect(piece.errors.messages.keys).to include :difficulty_level
      end

      it 'returns false when difficulty level is not an integer' do
        user = User.create!(user_name: 'user', email: 'user@mail.com',
                            password: 'password')
        instrument = Instrument.create!(name: 'Violão', user: user)
        period = Period.create!(name: 'Romântico', start_year: 1810, end_year: 1890,
                                user: user)
        composer = Composer.create!(name: 'Dias Branco', period: period, user: user)

        piece = Piece.new(title: 'Etude', composer: composer, period: period,
                          instrument: instrument, start_date: 1.day.ago,
                          difficulty_level: 'five', user: user)

        expect(piece).not_to be_valid
        expect(piece.errors.messages.keys).to include :difficulty_level
      end
    end

  end

  context 'dates' do
    describe '#valid?' do
      it 'returns false when start_date is after finish_date' do
        user = User.create!(user_name: 'user', email: 'user@mail.com',
                            password: 'password')
        instrument = Instrument.create!(name: 'Violão', user: user)
        period = Period.create!(name: 'Romântico', start_year: 1810, end_year: 1890,
                                user: user)
        composer = Composer.create!(name: 'Dias Branco', period: period, user: user)

        piece = Piece.new(title: 'Etude', composer: composer, period: period,
                          instrument: instrument, start_date: 1.day.ago,
                          finish_date: 2.days.ago, user: user)

        expect(piece).not_to be_valid
        expect(piece.errors.messages.keys).to include :finish_date
      end
    end
  end

  context 'all valid' do
    describe '#valid?' do
      it 'returns true when all fields are valid' do
        user = User.create!(user_name: 'user', email: 'user@mail.com',
                            password: 'password')
        instrument = Instrument.create!(name: 'Violão', user: user)
        period = Period.create!(name: 'Romântico', start_year: 1810, end_year: 1890,
                                user: user)
        composer = Composer.create!(name: 'Dias Branco', period: period, user: user)

        piece = Piece.new(title: 'Etude', composer: composer, period: period,
                          instrument: instrument, start_date: 1.day.ago, user: user)

        expect(piece).to be_valid
      end
    end
  end
end
