class AddGeocodingToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :lat, :string
    add_column :jobs, :lng, :string
    add_column :jobs, :distance, :integer
  end

  def self.down
    remove_column :jobs, :distance
    remove_column :jobs, :lng
    remove_column :jobs, :lat
  end
end
