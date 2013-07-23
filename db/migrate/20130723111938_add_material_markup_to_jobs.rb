class AddMaterialMarkupToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :material_markup, :decimal, :null => false, :default => 1.2, :precision => 10, :scale => 2

  end
end
