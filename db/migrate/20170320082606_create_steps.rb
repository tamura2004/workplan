class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.string :number
      t.string :name

      t.timestamps
    end
  end
end
