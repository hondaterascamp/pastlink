class AddColumnsToTroubles < ActiveRecord::Migration[8.0]
  def change
    add_reference :troubles, :machine, null: false, foreign_key: true
    add_reference :troubles, :product, null: false, foreign_key: true
    add_reference :troubles, :user, null: false, foreign_key: true
    add_column :troubles, :content, :text
    add_column :troubles, :stopped_at, :datetime
    add_column :troubles, :downtime, :integer
    add_column :troubles, :status, :integer, default: 0, null: false
  end
end
