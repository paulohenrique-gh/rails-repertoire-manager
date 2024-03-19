FactoryBot.define do
  factory :period do
    name { 'Clássico' }
    start_year { 1830 }
    end_year { 1720 }
    description { "Período clássico da música" }
  end
end
