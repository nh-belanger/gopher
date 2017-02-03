class ApiRedo < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :access_token, :string
    add_column :members, :refresh_token, :string
  end
end
