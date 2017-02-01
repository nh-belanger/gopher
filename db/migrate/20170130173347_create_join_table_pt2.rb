class CreateJoinTablePt2 < ActiveRecord::Migration[5.0]
  def up
    create_table :membersteetimes, id: false do |t|
      t.belongs_to :member, index: true
      t.belongs_to :teetime, index: true
    end
  end
  def down
    drop_table :membersteetimes
  end
end
