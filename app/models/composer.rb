class Composer < ApplicationRecord
  belongs_to :period
  belongs_to :user
end
