class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.string :description
      t.string :website_url
      t.string :phone_number
      t.string :logo_url

      t.timestamps
    end
  end
end
