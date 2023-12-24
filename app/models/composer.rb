class Composer < ApplicationRecord
  belongs_to :period
  belongs_to :user

  has_many :pieces

  validates :name, presence: true
end
