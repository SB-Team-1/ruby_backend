class ChangeAllianceNullTrue < ActiveRecord::Migration[6.1]
  def change
    change_column_null :businesses, :alliance_id, true
  end
end
