class AddLaborExtrasToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :gibraltar_courses_of_block, :integer, :default => 4
    add_column :jobs, :labor_schedule, :text
  end
end
