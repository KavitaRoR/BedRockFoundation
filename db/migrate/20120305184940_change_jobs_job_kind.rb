class ChangeJobsJobKind < ActiveRecord::Migration
  def up
    add_column :jobs, :job_type_id, :integer, :default => 1
    create_table :job_types do |t|
      t.string :kind
      t.timestamps
    end
  end

  def down
  end
end
