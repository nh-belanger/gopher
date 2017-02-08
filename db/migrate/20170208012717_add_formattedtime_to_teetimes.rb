class AddFormattedtimeToTeetimes < ActiveRecord::Migration[5.0]
  def change
    add_column :teetimes, :formattedtime, :string
  end
end
