class AddCreatorToTeetimes < ActiveRecord::Migration[5.0]
  def change
    add_column :teetimes, :creator, :string
  end
end
