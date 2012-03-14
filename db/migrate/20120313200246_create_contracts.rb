class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :job_id
      t.integer :estimate_id
      t.integer :crew_id
      t.datetime :scheduled_date
      t.integer :position_in_day

      t.timestamps
    end
  end
end
