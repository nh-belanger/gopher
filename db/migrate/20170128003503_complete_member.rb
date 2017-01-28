class CompleteMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :first_name, :string, null: false
    add_column :members, :last_name, :string, null: false
    add_column :members, :member_number, :integer, null: false
  end
end
