class CreateMachines < ActiveRecord::Migration[8.0]
  def change
    create_table :machines do |t|
      t.timestamps
    end
  end
end
