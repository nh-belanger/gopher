class RedoJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :timesheet do |t|
      t.belongs_to :member, index: true
      t.belongs_to :teetime, index: true
    end
  end
end
