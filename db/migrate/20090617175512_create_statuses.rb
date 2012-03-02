class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.references :job
      t.references :next_action
      t.text :notes
      t.integer :asssgned_by
      t.integer :assigned_to
      t.timestamps
    end
  end
  
  def self.down
    drop_table :statuses
  end
end
