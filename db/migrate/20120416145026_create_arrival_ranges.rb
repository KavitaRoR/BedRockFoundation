class CreateArrivalRanges < ActiveRecord::Migration
  def change
    create_table :arrival_ranges do |t|
      t.string :early
      t.string :late

      t.timestamps
    end
    
    add_column :contracts, :arrival_range_id, :integer
  end
end
