class CreateNextActions < ActiveRecord::Migration
  def self.up
    create_table :next_actions do |t|
      t.string :name
      t.boolean :requires_phone_call
      t.boolean :on_hold
      t.boolean :requires_visit
      t.boolean :requires_research
      t.timestamps
    end
  end
  
  def self.down
    drop_table :next_actions
  end
end
