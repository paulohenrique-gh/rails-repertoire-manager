FactoryBot.define do
  factory :period do
    name { 'Clássico' }
    start_year { 1730 }
    end_year { 1820 }
    description { "Período clássico da música" }
  end
end
