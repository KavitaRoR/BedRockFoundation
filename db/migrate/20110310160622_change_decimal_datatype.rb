class ChangeDecimalDatatype < ActiveRecord::Migration
  def self.up
    change_column :jobs, :discount, :decimal, :decimal => 0.00, :precision => 10, :scale => 2
    change_column :jobs, :additional_price, :decimal, :default => 0.00, :precision => 10, :scale => 2
  end

  def self.down
  end
end
