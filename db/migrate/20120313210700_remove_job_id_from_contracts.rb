class RemoveJobIdFromContracts < ActiveRecord::Migration
  def up
    remove_column :contracts, :job_id
  end

  def down
  end
end
