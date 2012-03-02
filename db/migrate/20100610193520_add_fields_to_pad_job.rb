class AddFieldsToPadJob < ActiveRecord::Migration
  def self.up
    add_column :pad_jobs, :shed_company, :string
    add_column :pad_jobs, :accessible_with_machine, :string
    add_column :pad_jobs, :additional_fill_dirt, :string
    add_column :pad_jobs, :build_up_timbers, :string
    add_column :pad_jobs, :timber_wall, :string
    add_column :pad_jobs, :economy_or_elite, :string
  end

  def self.down
    remove_column :pad_jobs, :economy_or_elite
    remove_column :pad_jobs, :timber_wall
    remove_column :pad_jobs, :build_up_timbers
    remove_column :pad_jobs, :additional_fill_dirt
    remove_column :pad_jobs, :accessible_with_machine
    remove_column :pad_jobs, :shed_company
  end
end
