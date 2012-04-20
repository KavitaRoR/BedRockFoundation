class AddErosionControlToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :erosion_control_lft, :integer

  end
end
