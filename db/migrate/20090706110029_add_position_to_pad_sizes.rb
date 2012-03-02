class AddPositionToPadSizes < ActiveRecord::Migration
  def self.up
    add_column :pad_sizes, :position, :integer
  end

  def self.down
    remove_column :pad_sizes, :position
  end
end
