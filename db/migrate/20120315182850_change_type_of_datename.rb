class ChangeTypeOfDatename < ActiveRecord::Migration
  def up
    change_column :schedule_days, :day_name, :datetime
    rename_column :schedule_days, :day_name, :day 
  end

  def down
  end
end
