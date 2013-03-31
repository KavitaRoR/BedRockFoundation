class TodoMailer < ActionMailer::Base
  

  def send_todo( status )
  	@url = contact_url( status.contact )
  	@status = status
  	@next_action = NextAction.find @status.next_action_id
		mail(from: Rails.application.config.FROM_EMAIL,
				 to: @status.assignee.email,
		     subject: "A new Todo item has been assigned to you"
		     )
  end
end
