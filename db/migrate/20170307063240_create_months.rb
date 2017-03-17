class CreateMonths < ActiveRecord::Migration[5.0]
  def change
    create_table :months do |t|
      t.date :date, null: false

      t.timestamps
    end
  end
end
