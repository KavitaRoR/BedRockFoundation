class AddOnMapToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :on_map, :boolean, :default => true

  end
end
