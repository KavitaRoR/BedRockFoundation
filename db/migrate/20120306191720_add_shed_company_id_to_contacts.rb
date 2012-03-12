class AddShedCompanyIdToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :shed_company_id, :integer
  end
end
