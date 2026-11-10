class DropEmployeesAndHomes < ActiveRecord::Migration[8.0]
  def change
    drop_table :employees do |t|
      t.timestamps
    end
    drop_table :homes do |t|
      t.timestamps
    end
  end
end