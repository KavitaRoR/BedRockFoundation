class ChangePadType < ActiveRecord::Migration
  def change
    change_column :estimates, :job_type_id, :integer, :default => 2
  end
end
