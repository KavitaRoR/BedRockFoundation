class AddTrexColorToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :trex_color, :string

  end
end
