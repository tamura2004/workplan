class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :number, null: false
      t.string :name, null: false
      t.references :rank, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
