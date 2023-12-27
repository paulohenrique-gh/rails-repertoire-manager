require 'rails_helper'

feature 'User register musical piece' do
  scenario 'from the home page' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')

    login_as user
    visit root_path
    click_on 'Músicas'
    click_on 'Cadastrar nova música'

    expect(page).to have_content 'Cadastro de música'
    expect(page).to have_field 'Título'
    expect(page).to have_field 'Opus'
    expect(page).to have_field 'Número'
    expect(page).to have_field 'Movimento'
    expect(page).to have_field 'Outros identificadores'
    expect(page).to have_field 'Compositor'
    expect(page).to have_field 'Período'
    expect(page).to have_field 'Data inicial'
    expect(page).to have_field 'Data final'
    expect(page).to have_field 'Instrumento'
    expect(page).to have_field 'Nível de dificuldade'
    expect(page).to have_button 'Enviar'
  end

  scenario 'successfully' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')
    instrument = Instrument.create!(name: 'Piano', user: user)
    period = Period.create!(name: 'Clássico', start_year: 1730, end_year: 1820,
                            user: user)
    composer = Composer.create!(name: 'Ludwig Van Beethoven', period: period,
                                user: user)

    login_as user
    visit new_piece_path
    fill_in 'Título', with: 'Moonlight Sonata'
    fill_in 'Opus', with: '27'
    fill_in 'Número', with: 2
    fill_in 'Outros identificadores', with: 'Sonata 14'
    select 'Ludwig Van Beethoven', from: 'Compositor'
    select 'Clássico', from: 'Período'
    fill_in 'Data inicial', with: 2.days.ago
    fill_in 'Data final', with: 1.day.ago
    select 'Piano', from: 'Instrumento'
    fill_in 'Nível de dificuldade', with: 10
    click_on 'Enviar'

    expect(page).to have_content 'Música cadastrada com sucesso'
    expect(user.reload.pieces.count).to eq 1
    piece = user.reload.pieces.last
    expect(piece.title).to eq 'Moonlight Sonata'
    expect(piece.opus).to eq '27'
    expect(piece.number).to eq 2
    expect(piece.other_identifiers).to eq 'Sonata 14'
    expect(piece.composer.name).to eq 'Ludwig Van Beethoven'
    expect(piece.period.name).to eq 'Clássico'
    expect(piece.start_date).to eq 2.days.ago.to_date
    expect(piece.finish_date).to eq 1.day.ago.to_date
    expect(piece.instrument.name).to eq 'Piano'
    expect(piece.difficulty_level).to eq 10
  end

  scenario 'and leaves required fields empty' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')
    instrument = Instrument.create!(name: 'Piano', user: user)
    period = Period.create!(name: 'Clássico', start_year: 1730, end_year: 1820,
                            user: user)
    composer = Composer.create!(name: 'Ludwig Van Beethoven', period: period,
                                user: user)

    login_as user
    visit new_piece_path
    fill_in 'Título', with: ''
    fill_in 'Data inicial', with: ''
    click_on 'Enviar'

    expect(page).to have_content 'Não foi possível cadastrar música'
    expect(user.reload.pieces.count).to eq 0
  end
end
