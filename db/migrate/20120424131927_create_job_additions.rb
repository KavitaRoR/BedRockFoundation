class CreateJobAdditions < ActiveRecord::Migration
  def change
    create_table :job_additions do |t|
      t.integer :addition_price_in_cents
      t.text :addition_description
      t.integer :job_id
      t.timestamps
    end
  end
end
