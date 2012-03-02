class AddDoneToStatuses < ActiveRecord::Migration
  def self.up
    add_column :statuses, :done, :boolean
  end

  def self.down
    remove_column :statuses, :done
  end
end
