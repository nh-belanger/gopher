class AddReservationRequest < ActiveRecord::Migration[5.0]
  def change
    create_table :reservationrequests do |t|
      t.integer :member_id, null: false
      t.integer :reservation_id, null: false
    end
  end
end
