class ChangePadVarsValueToDecimal < ActiveRecord::Migration
  def self.up
    change_column :rock_pad_variables, :value, :decimal, :decimal => 0.00, :precision => 10, :scale => 2
  end

  def self.down
  end
end
