class CreateContentData < ActiveRecord::Migration
  def change
    create_table :content_data do |t|
      t.string :key
      t.string :description
      t.text :value

      t.timestamps
    end
  end
end
