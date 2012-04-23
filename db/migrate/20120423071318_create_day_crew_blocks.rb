class CreateDayCrewBlocks < ActiveRecord::Migration
  def change
    create_table :day_crew_blocks do |t|
      t.integer :crew_id
      t.string :reason
      t.datetime :day
      t.integer :contract_id

      t.timestamps
    end
  end
end
