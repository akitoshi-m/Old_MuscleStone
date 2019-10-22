class AddColumnsToMenu < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :part, :string
  end
end
