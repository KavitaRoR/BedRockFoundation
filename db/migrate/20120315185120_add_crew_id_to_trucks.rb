class AddCrewIdToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :crew_id, :integer
  end
end
