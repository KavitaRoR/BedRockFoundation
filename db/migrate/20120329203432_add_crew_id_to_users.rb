class AddCrewIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :crew_id, :integer

  end
end
