class AddPositionToFoundations < ActiveRecord::Migration
  def self.up
    add_column :foundations, :position, :integer
  end

  def self.down
    remove_column :foundations, :position
  end
end
