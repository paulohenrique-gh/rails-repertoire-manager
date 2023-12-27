class ChangeNullFinishDateFromPieces < ActiveRecord::Migration[7.1]
  def change
    change_column_null :pieces, :finish_date, true
  end
end
