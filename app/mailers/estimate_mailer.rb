class EstimateMailer < ActionMailer::Base
  default from: "stoltz@bedrockfoundations.com"

  def send_to_contact(estimate)
    logger.debug("In Mailer")
    @estimate = estimate
    logger.debug("#{@estimate.job.contact.first_name} #{@estimate.job.contact.last_name} #{@estimate.job.contact.email}" )
    mail :to => "#{@estimate.job.contact.email}", :bcc => "stoltz@bedrockfoundations.com, timothy@wearefound.com", :from => "stoltz@bedrockfoundations.com", :subject => "Your Estimate from Bed Rock Foundations"
  end
end
