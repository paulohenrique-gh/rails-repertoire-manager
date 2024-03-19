class CreatePeriods < ActiveRecord::Migration[7.1]
  def change
    create_table :periods do |t|
      t.string :name
      t.integer :start_year
      t.integer :end_year
      t.text :description

      t.timestamps
    end
  end
end
