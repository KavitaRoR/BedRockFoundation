class AddEmailSignatureToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_signature, :text

  end
end
