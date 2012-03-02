class AddPhoneWorkToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :phone_work, :string
  end

  def self.down
    remove_column :contacts, :phone_work
  end
end
