class CreateComposers < ActiveRecord::Migration[7.1]
  def change
    create_table :composers do |t|
      t.string :name
      t.text :notes
      t.references :period, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
