class AddAdditionalBuildupLaborToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :additional_buildup_labor, :integer, :default => 0

  end
end
