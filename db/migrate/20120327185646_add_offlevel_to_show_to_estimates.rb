class AddOfflevelToShowToEstimates < ActiveRecord::Migration
  def change
    add_column :estimates, :off_level_to_show, :string, :default => "12,18,24,30,36"
  end
end
