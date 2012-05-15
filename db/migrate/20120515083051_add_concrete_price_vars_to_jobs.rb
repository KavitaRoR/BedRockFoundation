class AddConcretePriceVarsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :concrete_price_per_yard, :integer, :default => 150
    
  end
end
