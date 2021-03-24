class CreateUserAlliances < ActiveRecord::Migration[6.1]
  def change
    create_table :user_alliances do |t|
      t.references :user, null: false, foreign_key: true
      t.references :alliance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
