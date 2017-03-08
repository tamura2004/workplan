class CreateAssigns < ActiveRecord::Migration[5.0]
  def change
    create_table :assigns do |t|
      t.references :group, foreign_key: true
      t.references :project, foreign_key: true
      t.references :system, foreign_key: true
      t.references :user, foreign_key: true
      t.date :month
      t.decimal :power

      t.timestamps
    end
  end
end
