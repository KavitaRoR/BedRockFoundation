class ChangeAsssgnedBy < ActiveRecord::Migration
  def self.up
    rename_column :statuses, :asssgned_by, :assigned_by
  end

  def self.down
  end
end
