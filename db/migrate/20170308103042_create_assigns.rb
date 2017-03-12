class CreateAssigns < ActiveRecord::Migration[5.0]
  def change
    create_table :assigns do |t|
      t.references :group, foreign_key: true
      t.references :project, foreign_key: true
      t.references :system, foreign_key: true
      t.references :user, foreign_key: true
      t.references :month, foreign_key: true
      t.decimal :power

      t.timestamps
    end

    add_index :assigns, [:project_id, :group_id, :system_id, :user_id, :month_id], unique: true, name: 'assign_index'

  end
end
