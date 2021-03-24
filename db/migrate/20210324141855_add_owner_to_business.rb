class AddOwnerToBusiness < ActiveRecord::Migration[6.1]
  def change
    add_reference :businesses, :user, index: true
  end
end
