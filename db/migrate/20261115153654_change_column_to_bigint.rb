class ChangeColumnToBigint < ActiveRecord::Migration[8.0]
  def change
    change_column :sessions, :user_id, :bigint
    change_column :troubles, :machine_id, :bigint
    change_column :troubles, :product_id, :bigint
    change_column :troubles, :user_id, :bigint
  end
end
