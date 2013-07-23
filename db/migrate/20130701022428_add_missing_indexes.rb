class AddMissingIndexes < ActiveRecord::Migration
  def change
    # add_index :job_additions, :job_id
    # add_index :library_files, :job_id
    add_index :jobs, :job_type_id
    add_index :jobs, :truck_id
    add_index :jobs, :contact_id
    add_index :jobs, :foundation_id
    add_index :jobs, :pad_size_id
    add_index :jobs, :location_id
    add_index :jobs, :foundation_calculator_id
    add_index :jobs, :calculation_location_id
    add_index :jobs, :bundle_with_job_id
    add_index :contracts, :estimate_id
    add_index :contracts, :crew_id
    add_index :contracts, :arrival_range_id
    add_index :contacts, :campaign_id
    add_index :contacts, :contact_status_id
    add_index :contacts, :shed_company_id
    add_index :users, :crew_id
    add_index :estimates, :job_id
    add_index :estimates, :job_type_id
    add_index :statuses, :next_action_id
    add_index :statuses, :job_id
    add_index :statuses, :contact_id
    add_index :trucks, :crew_id
    add_index :day_crew_blocks, :crew_id
  end
end
