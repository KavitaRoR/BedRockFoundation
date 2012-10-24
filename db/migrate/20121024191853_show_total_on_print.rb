class ShowTotalOnPrint < ActiveRecord::Migration
  def change
    change_column :estimates, :show_payment_buttons, :boolean, :default => true
  end
end
