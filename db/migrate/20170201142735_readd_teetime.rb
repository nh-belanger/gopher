class ReaddTeetime < ActiveRecord::Migration[5.0]
  def change
    create_table :teetimes do |t|
      t.time :time, null: false
      t.date :day, null: false
      t.integer :starting_hole, null: false
    end
  end
end
