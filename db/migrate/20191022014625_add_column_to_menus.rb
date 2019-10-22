class AddColumnToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :training_name, :string
    add_column :menus, :date, :date
  end
end
