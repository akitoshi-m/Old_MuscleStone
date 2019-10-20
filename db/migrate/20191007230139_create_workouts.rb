class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.string :description
      t.string :image

      t.timestamps
    end
    add_index :workouts, [:user_id, :created_at]
  end
end
