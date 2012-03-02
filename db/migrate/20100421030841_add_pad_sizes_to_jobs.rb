class AddPadSizesToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :width, :integer
    add_column :jobs, :length, :integer
    add_column :jobs, :additional_price, :integer
  end

  def self.down
    remove_column :jobs, :additional_price
    remove_column :jobs, :length
    remove_column :jobs, :width
  end
end
