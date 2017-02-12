class AddingGroupRequest < ActiveRecord::Migration[5.0]
  def change
    create_table :grouprequests do |t|
      t.integer :member_id, null: false
      t.integer :group_id, null: false
    end
  end
end
