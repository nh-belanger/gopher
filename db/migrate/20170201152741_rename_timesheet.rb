class RenameTimesheet < ActiveRecord::Migration[5.0]
  def change
    rename_table :timesheet, :timesheets
  end
end
