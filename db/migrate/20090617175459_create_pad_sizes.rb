class CreatePadSizes < ActiveRecord::Migration
  def self.up
    create_table :pad_sizes do |t|
      t.integer :length
      t.integer :width
      t.integer :price_in_cents
      t.integer :material_cost_in_cents
      t.integer :labor_cost_in_cents
      t.timestamps
    end
  end
  
  def self.down
    drop_table :pad_sizes
  end
end
