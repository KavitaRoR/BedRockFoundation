class FirebaseEstimates
  # @@base_uri = 'https://bedrock.firebaseio.com/'

  def self.persist(estimate)
    Firebase.base_uri = 'https://bedrock.firebaseio.com/'
    valid = false

    data = OpenStruct.new

    data.additional_notes = estimate.additional_notes
    data.scheduled_day = estimate.contract.try(:scheduled_date).try(:strftime, "%Y-%m-%d")
    data.crew_id = estimate.contract.try(:crew_id)
    data.slot = estimate.contract.try(:position_in_day)
    data.size_and_type = estimate.job.size_and_type
    data.invoice_number = estimate.invoice_number
    data.off_level_fill_type = estimate.job.try(:off_level_fill_type)
    data.arrival_range = "#{estimate.contract.try(:arrival_range).try(:early)} and #{estimate.contract.try(:arrival_range).try(:late)}"
    data.location_abbreviation = estimate.job.location.abbreviation

    data.customer_info = OpenStruct.new
    data.customer_info.full_name = estimate.job.contact.name rescue "deleted job"
    data.customer_info.city = estimate.job.contact.city
    data.customer_info.province = estimate.job.contact.province
    data.customer_info = data.customer_info.marshal_dump



    data = data.marshal_dump
    if estimate.firebase_token.present? && Firebase.get("contracts/#{estimate.firebase_token}").success?
      response = Firebase.set("contracts/#{estimate.firebase_token}", data)
      valid = response.success?
    else
      response = Firebase.push("contracts", data)
      if response.success? # => true
        estimate.firebase_token = response.body['name']
        valid = true
      else
        puts response.body.inspect
      end
    end
    valid
  end 
end