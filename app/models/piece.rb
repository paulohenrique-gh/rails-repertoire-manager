class Piece < ApplicationRecord
  belongs_to :composer
  belongs_to :period
  belongs_to :instrument
end
