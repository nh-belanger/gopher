class AddingTeetimeRequest < ActiveRecord::Migration[5.0]
  def change
    create_table :teetimerequests do |t|
      t.integer :member_id, null: false
      t.integer :teetime_id, null: false
    end
  end
end
