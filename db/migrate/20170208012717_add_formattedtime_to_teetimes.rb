class AddFormattedtimeToTeetimes < ActiveRecord::Migration[5.0]
  def change
    add_column :teetimes, :formatted_time, :string
  end
end
