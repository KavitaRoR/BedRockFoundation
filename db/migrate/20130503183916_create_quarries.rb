class CreateQuarries < ActiveRecord::Migration
  def change
    create_table :quarries do |t|
      t.string :name
      t.string :lat
      t.string :lng
      t.integer :distance
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
