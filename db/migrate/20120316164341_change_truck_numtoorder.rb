class ChangeTruckNumtoorder < ActiveRecord::Migration
  def up
  	rename_column :crews, :truck_num, :ordering
  end

  def down
  end
end
