class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :number, null: false
      t.string :name, null: false
      t.references :month, foreign_key: true

      t.timestamps
    end
  end
end
