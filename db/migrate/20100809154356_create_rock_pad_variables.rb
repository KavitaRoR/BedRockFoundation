class CreateRockPadVariables < ActiveRecord::Migration
  def self.up
    create_table :rock_pad_variables do |t|
      t.string :key
      t.decimal :value

      t.timestamps
    end
  end

  def self.down
    drop_table :rock_pad_variables
  end
end
