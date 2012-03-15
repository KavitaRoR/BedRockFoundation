class DropShedCompaniesFromExistence < ActiveRecord::Migration
  def up
    drop_table :shed_companies
  end

  def down
  end
end
