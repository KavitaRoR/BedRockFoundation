class Add6by6BorderToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :border_sixbysix, :boolean, :default => false
  end

  def self.down
    add_column :jobs, :border_sixbysix
  end
end
