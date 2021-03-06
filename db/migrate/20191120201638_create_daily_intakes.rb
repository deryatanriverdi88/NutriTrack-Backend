class CreateDailyIntakes < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_intakes do |t|
      t.belongs_to :user
      t.string :meal_type
      t.date :date
      t.belongs_to :food
      t.integer :serving
      t.timestamps
    end
  end
end
