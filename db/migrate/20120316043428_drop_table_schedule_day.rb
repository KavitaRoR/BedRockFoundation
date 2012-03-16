class DropTableScheduleDay < ActiveRecord::Migration
  def up
    drop_table :schedule_days
  end

  def down
  end
end
