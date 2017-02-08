class AddCreatorIdToTeetimes < ActiveRecord::Migration[5.0]
  def change
    add_column :teetimes, :creator_id, :integer
  end
end
