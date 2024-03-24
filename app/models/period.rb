class Period < ApplicationRecord
  validates :name, :start_year, presence: true

  validates :start_year, :end_year, numericality: { greater_than: 1 }, allow_blank: true
  validates :end_year, comparison: { greater_than_or_equal_to: :start_year }

  validates :name, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }, allow_blank: true
end
