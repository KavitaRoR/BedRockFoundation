class AddJobStatusInfoToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :job_status, :string

    add_column :jobs, :job_status_reason, :text

  end
end
