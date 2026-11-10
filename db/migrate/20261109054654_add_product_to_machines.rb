class AddProductToMachines < ActiveRecord::Migration[8.0]
  def change
    add_reference :machines, :product, null: false, foreign_key: true
  end
end
