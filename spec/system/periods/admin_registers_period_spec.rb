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
