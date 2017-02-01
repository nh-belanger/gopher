class FixTeetimePt2 < ActiveRecord::Migration[5.0]
  def change
    rename_column :teetimes, :day, :date
  end
end
