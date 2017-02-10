class AddMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.belongs_to :member, index: true
      t.belongs_to :group, index: true
    end
  end
end
