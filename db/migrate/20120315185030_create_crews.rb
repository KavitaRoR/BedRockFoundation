class CreateCrews < ActiveRecord::Migration
  def change
    create_table :crews do |t|
      t.string :crew_name
      t.string :crew_base_address
      t.string :lat
      t.string :lng
      t.integer :crew_size
      t.integer :velocity

      t.timestamps
    end
  end
end
