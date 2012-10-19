class BundledJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :bundle_with_job_id, :integer
  end

end
