class Stupid < ActiveRecord::Migration[5.0]
  def change
    rename_table :dining, :dinings
  end
end
