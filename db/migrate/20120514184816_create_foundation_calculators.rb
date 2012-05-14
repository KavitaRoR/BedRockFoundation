class CreateFoundationCalculators < ActiveRecord::Migration
  def change
    create_table :foundation_calculators do |t|
      t.string :kind
      t.integer :position
      t.text :description
    
      t.timestamps
    end
    add_column :jobs, :foundation_calculator_id, :integer, :default => 1
    
    add_index :jobs, :id
  end
end
