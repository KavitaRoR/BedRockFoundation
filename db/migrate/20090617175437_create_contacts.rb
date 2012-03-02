class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :company
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :phone_alt
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.integer :zip
      t.references :campaign
      t.string :state
      t.timestamps
    end
  end
  
  def self.down
    drop_table :contacts
  end
end
