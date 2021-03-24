class CreateBusinessAlliances < ActiveRecord::Migration[6.1]
  def change
    create_table :business_alliances do |t|
      t.references :business, null: false, foreign_key: true
      t.references :alliance, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
