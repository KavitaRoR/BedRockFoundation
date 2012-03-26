class EstimateMailer < ActionMailer::Base
  default from: "app@abundantscapes.com"

  def send_to_contact(estimate)
    logger.debug("In Mailer")
    @estimate = estimate
    logger.debug("#{@estimate.job.contact.first_name} #{@estimate.job.contact.last_name} #{@estimate.job.contact.email}" )
    mail :to => "#{@estimate.job.contact.first_name + " " + @estimate.job.contact.last_name } <#{@estimate.job.contact.email}>", :from => "estimates@abundantscapes.com", :subject => "Estimate from Bed Rock Foundations"
  end
end
