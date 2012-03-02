class AddGeocodingToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :lat, :string
    add_column :contacts, :lng, :string
    add_column :contacts, :distance, :integer
  end

  def self.down
    remove_column :contacts, :distance
    remove_column :contacts, :lng
    remove_column :contacts, :lat
  end
end
