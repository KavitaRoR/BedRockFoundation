class AddDiscountToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :discount, :decimal, :default => 0.0
  end

  def self.down
    remove_column :jobs, :discount
  end
end
