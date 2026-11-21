class ChangeColumnToBigint2 < ActiveRecord::Migration[8.0]
  def change
    change_column "users", "department_id", :bigint
  end
end
