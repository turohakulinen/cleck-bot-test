class AddTypeToNode < ActiveRecord::Migration[5.0]
  def change
    add_column :nodes, :type, :string
  end
end
