class AddFullToTeetime < ActiveRecord::Migration[5.0]
  def change
    add_column :teetimes, :full, :boolean
  end
end
