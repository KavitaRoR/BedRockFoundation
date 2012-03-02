class AddCrewAndRigToJob < ActiveRecord::Migration
  def self.up
    add_column :jobs, :crew_name, :string
    add_column :jobs, :rig_name, :string
  end

  def self.down
    remove_column :jobs, :crew_name
    remove_column :jobs, :rig_name
  end
end
