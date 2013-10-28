class CreateMaterialQuantityLabels < ActiveRecord::Migration
  def change
    create_table :material_quantity_labels do |t|
      t.string :name

      t.timestamps
    end
    ["each","pack","sqft","cubic ft","sqyd","cubic yard","ton","truckload","mile","hour",""].each do |l|
      mql = MaterialQuantityLabel.new
      mql.name = l
      mql.save
    end
  end
end
