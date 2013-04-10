class EstimateMailer < ActionMailer::Base
  default from: "stoltz@bedrockfoundations.com"

  def send_to_contact( estimate, params )
    logger.debug("In Mailer")
    @estimate = estimate
    @user = User.find( params[:from] )
    @footer = params[:footer]
    logger.debug("#{@estimate.job.contact.first_name} #{@estimate.job.contact.last_name} #{@estimate.job.contact.email}" )
    mail(	:to => "#{@estimate.job.contact.email}", 
    		 	:bcc => "stoltz@bedrockfoundations.com, timothy@wearefound.com", 
    		 	:from => "#{@user.email}", 
    		 	:subject => "#{params[:subject]}" )
  end
end
