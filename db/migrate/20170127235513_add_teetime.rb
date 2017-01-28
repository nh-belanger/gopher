class AddTeetime < ActiveRecord::Migration[5.0]
  def change
    create_table :teetimes do |t|
      t.integer :time, null: false
      t.integer :day, null: false
      t.integer :starting_hole, null: false
    end
  end
end
