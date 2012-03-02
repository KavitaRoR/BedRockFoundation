class CreateTrucks < ActiveRecord::Migration
  def self.up
    create_table :trucks do |t|
      t.string :name
      t.string :phone
      t.string :color
      t.timestamps
    end
  end
  
  def self.down
    drop_table :trucks
  end
end
