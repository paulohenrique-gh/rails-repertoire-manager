class Period < ApplicationRecord
  belongs_to :user

  validates :name, :start_year, :end_year, presence: true
end
