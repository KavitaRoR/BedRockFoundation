class AddPositionToNextActions < ActiveRecord::Migration
  def self.up
    add_column :next_actions, :position, :integer
  end

  def self.down
    remove_column :next_actions, :position
  end
end
