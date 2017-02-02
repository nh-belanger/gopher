class Stupidpt2 < ActiveRecord::Migration[5.0]
  def change
      rename_column :dinings, :reservaton_id, :reservation_id
  end
end
