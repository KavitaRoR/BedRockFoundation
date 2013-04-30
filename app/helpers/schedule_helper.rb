module ScheduleHelper
	def show_clickable_address( contract )
		address = get_address( contract )

		if contract.estimate.job.lat.nil? && contract.estimate.job.lng.nil?
			address.html_safe
		else
			raw( link_to( address, 
				"http://maps.google.com/maps?q=#{contract.estimate.job.lat}, #{contract.estimate.job.lng}",
				rel: "#{contract.estimate.job.lat}, #{contract.estimate.job.lng}", target: "_blank",
				class: "job_site" ) )
		end
							
	end

	def get_address( contract )
		address = ""
		address += contract.estimate.job.address_1 rescue ""
		address += "<br />"
		address += contract.estimate.job.address_2 if !contract.estimate.job.address_2.empty? rescue "" + "<br />"
		address += contract.estimate.job.city rescue ""
		address += ","
		address += contract.estimate.job.province rescue ""
		address += contract.estimate.job.zip.to_s rescue ""
		address.html_safe
	end
end
