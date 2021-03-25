class AddAllianceIdToBusiness < ActiveRecord::Migration[6.1]
  def change
    add_reference :businesses, :alliance, index: true
  end
end
