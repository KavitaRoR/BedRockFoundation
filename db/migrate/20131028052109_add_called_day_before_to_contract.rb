class AddCalledDayBeforeToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :called_day_before, :boolean, default: false
    add_column :jobs, :site_check_at, :datetime
    add_column :jobs, :site_check_potentially_work, :boolean, default: false

  end
end
