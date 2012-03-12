class CreateShedCompanies < ActiveRecord::Migration
  def change
    create_table :shed_companies do |t|
      t.string :company
      t.timestamps
    end
  end
end
