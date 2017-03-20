class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.references :user, foreign_key: true
      t.references :month, foreign_key: true
      t.integer :power

      t.timestamps
    end
  end
end
