class CreateSystems < ActiveRecord::Migration[5.0]
  def change
    create_table :systems do |t|
      t.string :number, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
