class AddCostMultiplierToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :multiplier, :decimal, :precision => 5, :scale => 1, :default => 1.0
  end
end
