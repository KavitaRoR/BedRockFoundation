class AddWireMeshToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :wire_mesh_linear_feet, :integer, :default => 0

  end
end
