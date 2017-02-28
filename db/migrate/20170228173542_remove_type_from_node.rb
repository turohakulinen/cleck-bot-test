class RemoveTypeFromNode < ActiveRecord::Migration[5.0]
  def change
    remove_column :nodes, :type
  end
end
