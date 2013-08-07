class Payment < ActiveRecord::Base

  def self.method_defaults
    ["Check", "Paypal", "Intuit GoPayment", "SlidePay", "Cash", "Other"]
  end
end
