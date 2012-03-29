class AddPermissionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :permissions_levels, :string
  end
end
