class AddScheduledEndToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :scheduled_to_end_at, :datetime
    add_column :materials, :quantity_label, :string
    add_column :materials, :category, :string
  end
end
