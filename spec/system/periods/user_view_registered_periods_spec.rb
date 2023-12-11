require 'rails_helper'

describe 'User visits registered periods page' do
  it 'from the home page' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')

    user.periods.create!(name: 'Clássico', start_year: 1730, end_year: 1820)
    user.periods.create!(name: 'Romântico', start_year: 1840, end_year: 1890)

    login_as user
    visit root_path
    click_on 'Períodos'

    expect(page).to have_content 'Clássico (1730 - 1820)'
    expect(page).to have_content 'Romântico (1840 - 1890)'
  end

  it 'and there is no registered period' do
    user = User.create!(user_name: 'user', email: 'user@mail.com',
                        password: 'password')

    login_as user
    visit root_path
    click_on 'Períodos'

    expect(page).to have_content 'Nenhum período cadastrado'
  end
end
