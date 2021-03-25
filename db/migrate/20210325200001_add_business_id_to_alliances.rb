class AddBusinessIdToAlliances < ActiveRecord::Migration[6.1]
  def change
    add_reference :alliances, :business, index: true
  end
end
