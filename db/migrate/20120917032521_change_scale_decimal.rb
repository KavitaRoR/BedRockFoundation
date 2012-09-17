class ChangeScaleDecimal < ActiveRecord::Migration
  def change
    change_column :wepay_checkout_records, :amount, :decimal, :precision => 10, :scale => 2
    change_column :wepay_checkout_records, :app_fee, :decimal, :precision => 10, :scale => 2
    change_column :wepay_checkout_records, :gross, :decimal, :precision => 10, :scale => 2
    change_column :wepay_checkout_records, :fee, :decimal, :precision => 10, :scale => 2
    change_column :wepay_checkout_records, :tax, :decimal, :precision => 10, :scale => 2
  end

end
