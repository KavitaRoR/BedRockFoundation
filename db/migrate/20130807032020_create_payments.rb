class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :estimate
      t.decimal :amount, scale: 2, precision: 10
      t.string :reference
      t.string :method
      t.integer :user_id
      t.datetime :deposited_at

      t.timestamps
    end
  end
end
