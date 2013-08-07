class TurnOffWepayDefault < ActiveRecord::Migration
  def up
    change_column_default :estimates, :show_payment_buttons, 0
  end

  def down
    change_column_default :estimates, :show_payment_buttons, :true
  end
end
