class AddHole < ActiveRecord::Migration[5.0]
  def change
    create_table :holes do |t|
      t.integer :number, null: false
      t.integer :par, null: false
      t.integer :length, null: false
      t.integer :score
    end
  end
end
