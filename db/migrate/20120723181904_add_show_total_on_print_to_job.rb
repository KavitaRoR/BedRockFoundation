class AddShowTotalOnPrintToJob < ActiveRecord::Migration
  def change
    add_column :estimates, :show_total_on_print, :boolean, :default => true
  end
end
