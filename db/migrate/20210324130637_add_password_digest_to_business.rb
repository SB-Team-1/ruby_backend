class AddPasswordDigestToBusiness < ActiveRecord::Migration[6.1]
  def change
    add_column :businesses, :email, :string
    add_column :businesses, :password_digest, :string
  end
end
