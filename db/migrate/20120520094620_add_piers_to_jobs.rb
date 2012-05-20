class AddPiersToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :concrete_piers_depth_in_inches, :integer, :default => 32
    add_column :jobs, :concrete_piers_diameter_in_inches, :integer, :default => 16
    
  end
end
