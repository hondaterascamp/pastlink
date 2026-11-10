class AddColumnsToMachines < ActiveRecord::Migration[8.0]
  def change
    add_column :machines, :name, :string
    add_column :machines, :code, :string
    add_reference :machines, :department, null: false, foreign_key: true
  end
end
