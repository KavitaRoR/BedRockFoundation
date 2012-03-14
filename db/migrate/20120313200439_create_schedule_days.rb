class CreateScheduleDays < ActiveRecord::Migration
  def change
    create_table :schedule_days do |t|
      t.string :day_name

      t.timestamps
    end
  end
end
