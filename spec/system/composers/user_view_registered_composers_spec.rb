require 'rails_helper'

describe 'User views registered instruments' do
  it 'from the home page' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')

    period = Period.create!(name: 'Clássico', start_year: 1730, end_year: 1820,
                            user: user)
    composer_one = Composer.create!(name: 'Beethoven', period: period, user: user)
    composer_two = Composer.create!(name: 'Mozart', period: period, user: user)

    login_as user
    visit root_path
    click_on 'Compositores'

    expect(page).to have_content 'Beethoven'
    expect(page).to have_content 'Mozart'
  end

  it 'and there is no registered composer' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')

    login_as user
    visit composers_path

    expect(page).to have_content 'Nenhum compositor cadastrado'
  end
end
