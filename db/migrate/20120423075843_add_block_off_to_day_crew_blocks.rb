class AddBlockOffToDayCrewBlocks < ActiveRecord::Migration
  def change
    add_column :day_crew_blocks, :block_off, :boolean
  end
end
