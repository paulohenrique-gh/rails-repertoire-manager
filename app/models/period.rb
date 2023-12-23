class Period < ApplicationRecord
  belongs_to :user

  validates :name, :start_year, :end_year, presence: true
  validates :start_year, comparison: { greater_than: 0 }
  validates :end_year, comparison: { greater_than: :start_year }
end
