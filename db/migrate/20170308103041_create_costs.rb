class CreateCosts < ActiveRecord::Migration[5.0]
  def change
    create_table :costs do |t|
      t.references :group, foreign_key: true
      t.references :project, foreign_key: true
      t.references :system, foreign_key: true
      t.references :rank, foreign_key: true
      t.date :month
      t.decimal :power

      t.timestamps
    end
  end
end
