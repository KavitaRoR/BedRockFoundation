estimates = Estimate.all

i = 7200
estimates.each do |e|
  e.update_attribute(:invoice_number, i)
  i = i+1
end