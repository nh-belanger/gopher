class AddFormatteddateToTeetimes < ActiveRecord::Migration[5.0]
  def change
    add_column :teetimes, :formatteddate, :string
  end
end
