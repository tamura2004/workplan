class CreateYears < ActiveRecord::Migration[5.1]
  def change
    create_table :years do |t|
      t.date :date, null: false

      t.timestamps
    end
  end
end
