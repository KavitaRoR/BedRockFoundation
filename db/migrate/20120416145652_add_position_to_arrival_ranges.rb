class AddPositionToArrivalRanges < ActiveRecord::Migration
  def change
    add_column :arrival_ranges, :position, :integer

  end
end
