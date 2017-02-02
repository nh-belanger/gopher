class AddingReservation < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.time :time, null: false
      t.date :day, null: false
      t.string :room, null: false
      t.integer :party_size, null: false
    end
  end
end
