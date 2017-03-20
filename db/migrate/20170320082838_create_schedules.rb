class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.references :project, foreign_key: true
      t.references :month, foreign_key: true
      t.references :step, foreign_key: true

      t.timestamps
    end
  end
end
