# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PeriodFormComponent, type: :component do
  it 'renders the form as expected' do
    period = create(:period, name: 'Romântico', start_year: 1800, end_year: 1850,
                             description: 'Período de Chopin e Schubert')
    form = render_inline(described_class.new(period:))

    expect(form).to have_css 'label', text: 'Nome'
    expect(form).to have_field 'Nome', type: 'text'
    expect(form).to have_css 'label', text: 'Ano de início'
    expect(form).to have_field 'Ano de início', type: 'number'
    expect(form).to have_css 'label', text: 'Ano de término'
    expect(form).to have_field 'Ano de término', type: 'number'
    expect(form).to have_css 'label', text: 'Descrição'
    expect(form).to have_css 'textarea', id: 'period_description'
    expect(form).to have_button 'Salvar'
  end
end
