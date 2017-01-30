class CreateJoinTablePt2 < ActiveRecord::Migration[5.0]
  def change
    drop_table :members_teetimes
    create_table :members_teetimes, id: false do |t|
      t.belongs_to :member, index: true
      t.belongs_to :teetime, index: true
    end
  end
end
