class CreatePieces < ActiveRecord::Migration[7.1]
  def change
    create_table :pieces do |t|
      t.string :title, null: false
      t.references :composer, null: false, foreign_key: true
      t.references :period, null: false, foreign_key: true
      t.date :start_date, null: false
      t.date :finish_date, null: false
      t.references :instrument, null: false, foreign_key: true
      t.integer :difficulty_level
      t.string :opus
      t.integer :number
      t.integer :movement
      t.string :other_identifiers

      t.timestamps
    end
  end
end
