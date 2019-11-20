class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :age
      t.string :gender
      t.float :weigth
      t.float :height
      t.string :image
      t.string :username
      t.integer :goal_calorie

      t.timestamps
    end
  end
end
