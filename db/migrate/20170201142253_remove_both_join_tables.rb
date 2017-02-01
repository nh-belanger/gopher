class RemoveBothJoinTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :members_teetimes
    drop_table :membersteetimes
    drop_table :teetimes
  end
end
