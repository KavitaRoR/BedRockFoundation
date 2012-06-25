class AddLocationInfoToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :address_1, :string
    add_column :locations, :city, :string
    add_column :locations, :province, :string
    add_column :locations, :zip, :integer
    add_column :locations, :use_for_estimates, :string, :default => "no"
    add_column :locations, :lat, :string
    add_column :locations, :lng, :string
    add_column :jobs, :calculation_location_id, :integer, :default => 5
  end
end
