class CreateTroubles < ActiveRecord::Migration[8.0]
  def change
    create_table :troubles do |t|
      t.timestamps
    end
  end
end
