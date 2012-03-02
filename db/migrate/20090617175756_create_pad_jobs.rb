class CreatePadJobs < ActiveRecord::Migration
  def self.up
    create_table :pad_jobs do |t|
      t.references :job
      t.references :foundation
      t.references :pad_size
      t.string :door_placement
      t.integer :off_level_amount_in_inches
      t.timestamps
    end
  end
  
  def self.down
    drop_table :pad_jobs
  end
end
