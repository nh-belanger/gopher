class AddingUnjoinToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :unjoinable, :boolean
  end
end
