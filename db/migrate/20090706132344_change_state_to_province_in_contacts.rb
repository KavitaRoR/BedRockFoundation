class ChangeStateToProvinceInContacts < ActiveRecord::Migration
  def self.up
    rename_column :contacts, :state, :province
  end

  def self.down
    rename_column :contacts, :province, :state
  end
end
