class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.string :name
      t.date :started_on
      t.integer :cost_in_cents
      t.timestamps
    end
  end
  
  def self.down
    drop_table :campaigns
  end
end
