class AddAreaToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :area, :decimal, :precision => 10, :scale => 2, :default => 0.0

  end
end
