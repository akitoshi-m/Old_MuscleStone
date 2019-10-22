class AddColumnToMenu < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :comment, :string
  end
end
