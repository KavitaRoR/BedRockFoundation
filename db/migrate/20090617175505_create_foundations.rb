class CreateFoundations < ActiveRecord::Migration
  def self.up
    create_table :foundations do |t|
      t.string :kind
      t.timestamps
    end
  end
  
  def self.down
    drop_table :foundations
  end
end
