class CreateMonths < ActiveRecord::Migration[5.0]
  def change
    create_table :months do |t|
      t.references :year, foreign_key: true, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
