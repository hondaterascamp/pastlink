class AddNameToDepartments < ActiveRecord::Migration[8.0]
  def change
    add_column :departments, :name, :string
  end
end
