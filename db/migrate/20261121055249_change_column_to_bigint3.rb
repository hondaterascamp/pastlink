class ChangeColumnToBigint3 < ActiveRecord::Migration[8.0]
  def change
    change_column "machines", "department_id", :bigint
    change_column "products", "department_id", :bigint
  end
end
