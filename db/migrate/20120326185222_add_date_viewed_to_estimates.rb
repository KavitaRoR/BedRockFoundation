class AddDateViewedToEstimates < ActiveRecord::Migration
  def change
    add_column :estimates, :date_of_client_view, :datetime
  end
end
