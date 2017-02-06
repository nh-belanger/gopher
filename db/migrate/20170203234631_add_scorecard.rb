class AddScorecard < ActiveRecord::Migration[5.0]
  def change
    create_table :scorecards do |t|
      t.integer :course_par, null: false
      t.integer :course_length, null: false
      t.integer :total_score
    end
  end
end
