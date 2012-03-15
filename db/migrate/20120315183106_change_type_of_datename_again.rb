class ChangeTypeOfDatenameAgain < ActiveRecord::Migration
  def up
    change_column :schedule_days, :day, :string
  end

  def down
  end
end
