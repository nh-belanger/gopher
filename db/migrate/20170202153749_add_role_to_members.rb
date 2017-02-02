class AddRoleToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :role, :string, null: false, default: "member"
  end
end

class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, null: false, default: "member"
  end
end
