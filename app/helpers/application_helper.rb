# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def payment_display( obj, &block )
		record_len = 0
		@total_paid = 0
		html 			 = ""
		record_len += obj.payments.length

		if record_len > 0
			capture &block
			

			obj.payments.each do |sq|
				paid_date = sq.updated_at.strftime("%m/%d/%Y")
				@total_paid += sq.amount
				if sq.amount > 0
					html += "<div class='wrapped relative'>"
					html += "<span class='ribbon'><span class='ribbon-inner'>Paid</span></span>"
					html += "<h3 style='font-weight: normal;'>A payment in the amount of <b>#{number_to_currency sq.amount}</b> was made on #{paid_date}</h3>"
					html += "</div>"				
				end
			end


			html += "<p>No payments have been made yet</p>" if @total_paid == 0
			html += "<br />"
			html.html_safe	
		end	
	end
end
