require 'rails_helper'

describe 'User registers new musical period' do
  context 'Admin role' do
    it 'successfully' do
      user = create(:user, role: :admin)

      login_as user
      visit root_path
      click_on 'Períodos'
      click_on 'Cadastrar Novo Período'
      fill_in 'Nome', with: 'Clássico'
      fill_in 'Ano de início', with: 1730
      fill_in 'Ano de término', with: 1820
      fill_in 'Descrição', with: 'Período clássico da música'
      click_on 'Salvar'

      expect(Period.count).to eq 1
      expect(page).to have_content 'Período cadastrado com sucesso.'
    end

    it 'with blank fields' do
      user = create(:user, role: :admin)

      login_as user
      visit new_period_path
      fill_in 'Nome', with: ''
      fill_in 'Ano de início', with: ''
      fill_in 'Ano de término', with: ''
      click_on 'Salvar'

      expect(Period.count).to eq 0
      expect(page).to have_content 'Não foi possível cadastrar o período'
      expect(page).to have_content 'Nome não pode ficar em branco'
      expect(page).to have_content 'Ano de início não pode ficar em branco'
      expect(page).to have_content 'Ano de término não pode ficar em branco'
    end
  end

  context 'User role' do
    it 'and does not see link to register new period' do
      user = create(:user, role: :user)

      login_as user
      visit root_path
      click_on 'Períodos'

      expect(page).not_to have_link 'Cadastrar Novo Período'
    end
  end
end
