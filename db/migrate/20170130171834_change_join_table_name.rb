class ChangeJoinTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :Members_Teetimes, :members_teetimes
  end
end
