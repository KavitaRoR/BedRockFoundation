class RemoveScheduleDay < ActiveRecord::Migration
  def up
    rename_column :contracts, :schedule_day_id, :scheduled_date
    change_column :contracts, :scheduled_date, :datetime 
  end

  def down
  end
end
