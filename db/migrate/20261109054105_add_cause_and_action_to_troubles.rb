class AddCauseAndActionToTroubles < ActiveRecord::Migration[8.0]
  def change
    add_column :troubles, :cause, :text
    add_column :troubles, :action, :text
  end
end
