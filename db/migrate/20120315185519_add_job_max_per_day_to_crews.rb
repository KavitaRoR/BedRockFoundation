class AddJobMaxPerDayToCrews < ActiveRecord::Migration
  def change
    add_column :crews, :job_max_per_day, :integer, :default => 3

  end
end
