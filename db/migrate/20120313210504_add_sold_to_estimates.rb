class AddSoldToEstimates < ActiveRecord::Migration
  def change
    add_column :estimates, :sold, :boolean, :default => false

  end
end
