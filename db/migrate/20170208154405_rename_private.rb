class RenamePrivate < ActiveRecord::Migration[5.0]
  def change
    rename_column :teetimes, :private, :unjoinable
  end
end
