class AddPrivateToTeetime < ActiveRecord::Migration[5.0]
  def change
    add_column :teetimes, :private, :boolean
  end
end
