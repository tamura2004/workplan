class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :number, null: false
      t.string :name, null: false
      t.references :dept, foreign_key: true, null: false

      t.timestamps
    end
  end
end
