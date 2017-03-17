class CreateRanks < ActiveRecord::Migration[5.0]
  def change
    create_table :ranks do |t|
      t.string :number, null: false
      t.string :name, null: false
      t.integer :unit_price

      t.timestamps
    end
  end
end
