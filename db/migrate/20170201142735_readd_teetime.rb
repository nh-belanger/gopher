class ReaddTeetime < ActiveRecord::Migration[5.0]
  def change
    create_table :teetimes do |t|
      t.time :time, null: false
      t.date :day, null: false
      t.integer :starting_hole, null: false
    end
  end
end

# TODO: re-build teetime timetable
# TODO: create migration to re-create the join table, the right way this time
