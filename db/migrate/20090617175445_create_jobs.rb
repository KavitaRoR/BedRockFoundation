class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.text :description
      t.datetime :originally_scheduled_at
      t.datetime :current_scheduled_at
      t.integer :duration_in_minutes
      t.integer :price_in_cents
      t.integer :material_cost_in_cents
      t.integer :labor_cost_in_cents
      t.references :foundation
      t.references :pad_size
      t.string :door_placement
      t.integer :off_level_amount_in_inches
      t.references :truck
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :province
      t.integer :zip
      t.references :contact
      t.timestamps
    end
  end
  
  def self.down
    drop_table :jobs
  end
end
