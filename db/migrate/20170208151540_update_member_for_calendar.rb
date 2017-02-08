class UpdateMemberForCalendar < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :token, :string
    add_column :members, :uid, :string
    add_column :members, :provider, :string
  end
end
