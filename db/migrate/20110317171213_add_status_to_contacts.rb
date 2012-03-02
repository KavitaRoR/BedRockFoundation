class AddStatusToContacts < ActiveRecord::Migration
  def self.up
     create_table :contact_statuses do |t|
        t.string   :status_name
        t.timestamps
      end
      
      add_column :contacts, :contact_status_id, :integer, :default => 1, :null => false
  end

  def self.down
    drop_table :contact_status
    remove_column :contacts, :contact_status_id
  end
end
