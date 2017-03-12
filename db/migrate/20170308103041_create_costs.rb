class CreateCosts < ActiveRecord::Migration[5.0]
  def change
    create_table :costs do |t|
      t.references :group, foreign_key: true
      t.references :project, foreign_key: true
      t.references :system, foreign_key: true
      t.references :rank, foreign_key: true
      t.references :month, foreign_key: true
      t.integer :power

      t.timestamps
    end

    add_index :costs, [:project_id, :group_id, :system_id, :rank_id, :month_id], unique: true, name: 'cost_index'
  end
end
