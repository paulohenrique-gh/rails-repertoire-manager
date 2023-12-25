class Instrument < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  def title_name
    name.titleize
  end
end
