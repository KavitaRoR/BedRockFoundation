class WepayCheckoutRecord < ActiveRecord::Base
  after_save :record_payment

  def record_payment
    Payment.create(amount: amount, reference: checkout_id, method: "WePay", estimate_id: reference_id) if state == "captured"
  end
end