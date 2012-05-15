class AddConcreteVarsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :concrete_thickness_in_inches, :integer, :default => 4
    add_column :jobs, :concrete_edge_thickness_in_inches, :integer, :default => 4
    add_column :jobs, :vapor_barrier, :boolean, :default => true
    add_column :jobs, :gravel_base_depth_in_inches, :integer, :default => 4
    add_column :jobs, :gibraltar_concrete_footer_in_inches, :integer, :default => 8
    add_column :jobs, :days_on_job, :integer, :default => 1
    add_column :jobs, :extra_man_days, :integer, :default => 1
    add_column :jobs, :number_of_piers, :integer, :default => 4
  end
end
