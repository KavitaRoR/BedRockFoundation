class AddSortableIntegerToCew < ActiveRecord::Migration
  def change
    add_column :crews, :truck_num, :integer, :default => 1
  end
end
