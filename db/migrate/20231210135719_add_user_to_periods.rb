class AddUserToPeriods < ActiveRecord::Migration[7.1]
  def change
    add_reference :periods, :user, null: false, foreign_key: true
  end
end
