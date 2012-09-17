class AddRecurringToEstimate < ActiveRecord::Migration
  def change
    add_column :estimates, :show_recurring_payment, :boolean, :default => false

    add_column :estimates, :show_payment_buttons, :boolean, :default => false

  end
end
