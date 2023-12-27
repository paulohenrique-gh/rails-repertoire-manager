class Piece < ApplicationRecord
  belongs_to :composer
  belongs_to :period
  belongs_to :instrument
  belongs_to :user

  validates :title, :start_date, presence: true
  validates :difficulty_level, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10,
    only_integer: true
  }

end
