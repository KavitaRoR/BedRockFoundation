class ChangeNameOfScheudledDateInTable < ActiveRecord::Migration
  def up
    rename_column :contracts, :scheduled_date, :schedule_day_id
    change_column :contracts, :schedule_day_id, :integer 
  end

  def down
  end
end
