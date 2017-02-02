class FixReservationsDay < ActiveRecord::Migration[5.0]
  def change
    rename_column :reservations, :day, :date
  end
end
