class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :project, foreign_key: true
      t.references :group, foreign_key: true
      t.references :system, foreign_key: true
      t.integer :price

      t.timestamps
    end

    add_index :orders, [:project_id, :group_id, :system_id], unique: true, name: 'order_index'
  end
end
