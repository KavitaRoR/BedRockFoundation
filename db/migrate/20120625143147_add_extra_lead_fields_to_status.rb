class AddExtraLeadFieldsToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :row_highlight_color, :string
    add_column :statuses, :revenue_potential, :string
    add_column :statuses, :percentage_probability, :integer
    add_column :statuses, :projected_sale_amount, :string
    add_column :statuses, :expected_close_date, :datetime
    add_column :statuses, :revenue_result, :string
    add_column :statuses, :current_situation, :string
    
  end
end
