class RenameEmailAddressToEmployeeNumberInUsers < ActiveRecord::Migration[8.0]
  def change
    rename_column :users, :email_address, :employee_number
  end
end
