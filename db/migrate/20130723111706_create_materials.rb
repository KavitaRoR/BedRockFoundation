class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.string :width, :default => "1\'"
      t.string :length, :default => "1\'"
      t.string :height, :default => "1\'"
      t.decimal :qty_per_pack, :default => 10.0, :precision => 10, :scale => 2
      t.decimal :price_per_pack, :default => 0.0, :precision => 10, :scale => 2
      t.integer :position, :default => 100

      t.timestamps
    end
  end
end
