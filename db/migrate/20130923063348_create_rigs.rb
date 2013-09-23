class CreateRigs < ActiveRecord::Migration
  def change
    create_table :rigs do |t|
      t.string :name

      t.timestamps
    end
    add_column :contracts, :rig_id, :integer
  end
end
