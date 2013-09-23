class AddMarkedAsDoneToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :marked_as_done_at, :datetime
    add_column :contracts, :marked_as_done_by, :integer
  end
end
