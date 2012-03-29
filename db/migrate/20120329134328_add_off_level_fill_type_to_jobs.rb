class AddOffLevelFillTypeToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :off_level_fill_type, :string, :default => "Build-Up"

  end
end
