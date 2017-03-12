class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :number
      t.string :name
      t.references :rank, foreign_key: true
      t.references :group, foreign_key: true
      t.date :end_month

      t.timestamps
    end
  end
end
