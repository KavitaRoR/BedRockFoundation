class ChangeEstimatesFlashvarsToText < ActiveRecord::Migration
  def up
    change_column :estimates, :flashvars, :text
  end

  def down
  end
end
