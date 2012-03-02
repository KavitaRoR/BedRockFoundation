class AddPadDepthToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :depth, :decimal
  end

  def self.down
    remove_column :jobs, :depth
  end
end
