class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.integer :job_id
      t.integer :job_type_id
      t.string :flashvars
      t.datetime :date_of_email_to_client
      t.string :token
      t.timestamps
    end
  end
end
