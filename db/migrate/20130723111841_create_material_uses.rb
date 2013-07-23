class CreateMaterialUses < ActiveRecord::Migration
  def change
    create_table :material_uses do |t|
      t.references :material, :null => false
      t.references :job, :null => false
      t.references :job_addition
      t.decimal :qty_estimated, :default => 1, :null => false, :precision => 10, :scale => 2
      t.decimal :qty_purchased, :default => 1, :null => false, :precision => 10, :scale => 2
      t.decimal :qty_used, :default => 1, :null => false, :precision => 10, :scale => 2

      t.timestamps
    end
    add_index :material_uses, :material_id
    add_index :material_uses, :job_id
    add_index :material_uses, :job_addition_id
  end
end
