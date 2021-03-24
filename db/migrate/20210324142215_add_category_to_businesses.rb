class AddCategoryToBusinesses < ActiveRecord::Migration[6.1]
  def change
    add_column :businesses, :category, :string
  end
end
