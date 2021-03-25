class AddColumnsToAlliances < ActiveRecord::Migration[6.1]
  def change
    add_column :alliances, :slogan, :string
    add_column :alliances, :description, :string
  end
end
