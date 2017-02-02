class CreateReservationJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :dining do |t|
      t.belongs_to :member, index: true
      t.belongs_to :reservaton, index: true
    end
  end
end
