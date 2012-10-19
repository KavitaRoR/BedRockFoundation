class CrewsWorkingWithCrews < ActiveRecord::Migration
  def change
    add_column :day_crew_blocks, :working_with_crew_id, :integer
  end
end
