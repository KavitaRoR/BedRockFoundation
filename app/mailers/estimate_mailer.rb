class EstimateMailer < ActionMailer::Base
  default from: "app@bedrockfoundations.com"

  def send_to_contact(estimate)
    logger.debug("In Mailer")
    @estimate = estimate
    logger.debug("#{@estimate.job.contact.first_name} #{@estimate.job.contact.last_name} #{@estimate.job.contact.email}" )
    mail :to => "#{@estimate.job.contact.email}", :from => "stoltz@bedrockfoundations.com", :subject => "Estimate from Bed Rock Foundations"
  end
end
