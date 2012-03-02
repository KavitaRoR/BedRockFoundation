class AddDescriptionToRockPadVariable < ActiveRecord::Migration
  def self.up
    add_column :rock_pad_variables, :description, :string
  end

  def self.down
    remove_column :rock_pad_variables, :description
  end
end
