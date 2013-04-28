# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def payment_display( obj, &block )
		record_len = 0
		@total_paid = 0
		html 			 = ""
		record_len += obj.wepay_checkout_records.length
		record_len += obj.square_payments.length
		record_len += obj.check_payments.length

		if record_len > 0 && obj.show_payment_buttons
			capture &block
			
			for wcr in obj.wepay_checkout_records.select{|w| w.state == "captured" || w.state == "authorized"}
				paid_date = wcr.updated_at.strftime("%m/%d/%Y")
				@total_paid += wcr.amount
			end

			obj.square_payments.each do |sq|
				paid_date = sq.updated_at.strftime("%m/%d/%Y")
				@total_paid += sq.total
			end

			obj.check_payments.each do |ch|
				paid_date = ch.updated_at.strftime("%m/%d/%Y")
				@total_paid += ch.total				
			end
		

			if @total_paid > 0
				html = "<div class='wrapped relative'>"
				html += "<span class='ribbon'><span class='ribbon-inner'>Paid</span></span>"
				html += "<h3>A payment in the amount of $#{@total_paid} was made on #{paid_date}</h3>"
				html += "</div>"				
			end

			html += "<p>No payments have been made yet</p>" if @total_paid == 0
			html.html_safe	
		end	
	end
end
