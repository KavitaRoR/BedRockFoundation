class EstimatesController < ApplicationController
  before_filter :authenticate_user!, except: [:client_estimate]
  layout 'client', :only => [:client_estimate]
  
  def email_estimate
    @job = Job.find(params[:id])
    begin
      @job_type = JobType.find(:first, conditions: {kind: params[:type].capitalize})
      @estimate = Estimate.find(:last, :conditions => {:job_id => params[:id], :job_type_id => @job_type.id})
      
      if !@estimate
        @estimate = Estimate.create(job_id: params[:id], job_type_id: @job_type.id, flashvars: @job.options_for_print(params[:type].capitalize).with_indifferent_access, token: SecureRandom.hex(16))
      end
      
      if EstimateMailer.send_to_contact(@estimate).deliver
        redirect_to :back, notice: "Mail Successfully sent to #{@estimate.job.contact.email}"
      else
        redirect_to :back, error: "Something went wrong emailing.  Try verifying the contact's email address."
      end
    rescue Exception => e
      logger.debug("Huge Problem Emailing estimate: #{e.message}")
      redirect_to :back, notice: "An Error occurred."
    end
  end
  
  def client_estimate
    @estimate = Estimate.find_by_token(params[:token])
    @estimate.flashvars = YAML::load(@estimate.flashvars).with_indifferent_access
  end
  
  def push_to_sold
    @job = Job.find(params[:id])
    begin
      @job_type = JobType.find(:first, conditions: {kind: params[:type].capitalize})
      @estimate = Estimate.find(:last, :conditions => {:job_id => params[:id], :job_type_id => @job_type.id})
      
      if !@estimate
        @estimate = Estimate.create(job_id: params[:id], job_type_id: @job_type.id, flashvars: @job.options_for_print(params[:type].capitalize).with_indifferent_access, token: SecureRandom.hex(16))
      end
      
      if @estimate.push_to_sold
        redirect_to "/schedule", notice: "The job is on the production schedule."
      else 
        redirect_to :back, error: "Something went terribly wrong.  Check the job data and try again."
      end
    rescue Exception => e
      logger.debug("Huge Problem: #{e.message}")
      redirect_to :back, notice: "An Error occurred."
    end
  end
end