class AddFollowupDateToStatuses < ActiveRecord::Migration
  def self.up
    add_column :statuses, :followup_date, :datetime
  end

  def self.down
    remove_column :statuses, :followup_date
  end
end
