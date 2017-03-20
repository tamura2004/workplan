class CreateAssigns < ActiveRecord::Migration[5.0]
  def change
    create_table :assigns do |t|
      t.references :order, foreign_key: true
      t.references :user, foreign_key: true
      t.references :month, foreign_key: true
      t.integer :power

      t.timestamps
    end
  end
end
