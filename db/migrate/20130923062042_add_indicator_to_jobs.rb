class AddIndicatorToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :indicator, :string

  end
end
