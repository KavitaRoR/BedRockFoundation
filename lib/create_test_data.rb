begin
  puts "This may take a bit.  Geocoding limits are being hit."
  Job.all.each do |job|
    if job.contact
      puts "#{job.id}"
      if job.economy_or_elite == "Standard"
        job.update_attribute(:job_type_id, 2) 
      elsif job.economy_or_elite == "Elite"
        job.update_attribute(:job_type_id, 3)
      end
      @estimate = Estimate.find(:last, :conditions => {:job_id => job.id, :job_type_id => (job.job_type_id rescue 1)})
      if !@estimate
        @estimate = Estimate.create(job_id: job.id, job_type_id: job.job_type_id, flashvars: job.options_for_print((job.job_type.kind rescue "Standard")).with_indifferent_access, token: SecureRandom.hex(16))
      else
      end
    end
  end
rescue Exception => e
  puts "#{e.message}"
end

puts "****** done with jobs ******"
begin
  Estimate.all.each do |est|
    if est.push_to_sold(User.first)
      puts "Completed Est: #{est.id}"
    else
      puts "Failed Est; #{est.id}"
    end
  end
rescue Exception => e
  puts "#{e.message}"
end

puts "****** completed ********"