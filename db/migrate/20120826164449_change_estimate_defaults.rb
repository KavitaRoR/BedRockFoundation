class ChangeEstimateDefaults < ActiveRecord::Migration
  def up
    change_column_default(:estimates, :off_level_to_show, nil)
    change_column_default(:estimates, :show_total_on_print, false)
  end

  def down
  end
end
