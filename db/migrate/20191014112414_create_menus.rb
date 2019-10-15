class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.integer :use_id
      t.string :description
      t.integer :weight
      t.integer :rep
      t.integer :set
      t.string :title

      t.timestamps
    end
  end
end
