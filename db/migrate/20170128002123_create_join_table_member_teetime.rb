class CreateJoinTableMemberTeetime < ActiveRecord::Migration[5.0]
  def change
    create_join_table :Members, :Teetimes do |t|
       t.index [:member_id, :teetime_id]
       t.index [:teetime_id, :member_id]
    end
  end
end
