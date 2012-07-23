class EstimatesController < ApplicationController
  before_filter :authenticate_user!, except: [:client_estimate]
  layout 'client', :only => [:client_estimate]
  
  def email_estimate
    @job = Job.find(params[:id])
    begin
      @job_type = JobType.find(:first, conditions: {kind: params[:type].capitalize})
      @estimate = Estimate.find(:last, :conditions => {:job_id => params[:id], :job_type_id => @job_type.id})

      if !@estimate
        @estimate = Estimate.create(job_id: params[:id], job_type_id: @job_type.id, flashvars: @job.options_for_print(params[:type].capitalize).with_indifferent_access, token: SecureRandom.hex(6))
      end

      @estimate.update_attribute(:date_of_email_to_client, Time.now)
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
    @estimate.update_attribute(:date_of_client_view, Time.now)
    
    @job = @estimate.job
    @job_type = @estimate.job_type
    @options_for_job = YAML::load(@estimate.flashvars).with_indifferent_access
    @type = @estimate.job_type.kind
    
  end
  
  def push_to_sold
    @job = Job.find(params[:id])
    @creator = current_user
    begin
      @job_type = JobType.find(:first, conditions: {kind: params[:type].capitalize})
      @estimate = Estimate.find(:last, :conditions => {:job_id => params[:id], :job_type_id => @job_type.id})
      
      if !@estimate
        @estimate = Estimate.create(job_id: params[:id], job_type_id: @job_type.id, flashvars: @job.options_for_print(params[:type].capitalize).with_indifferent_access, token: SecureRandom.hex(16))
      end
      
      if @estimate.push_to_sold
        @estimate.job.statuses.last.update_attribute("done", true)
        @estimate.job.statuses.create({:notes => "Sold!", :assigned_by => @creator.id, :assigned_to => @creator.id, :done => true, :next_action_id => 7})
        redirect_to "/schedule", notice: "The job is on the production schedule."
      else 
        redirect_to :back, error: "Something went terribly wrong.  Check the job data and try again."
      end
    rescue Exception => e
      logger.debug("Huge Problem: #{e.message}")
      redirect_to :back, notice: "An Error occurred."
    end
  end
  
  def off_level_to_show
    arr = []
    show_total_on_print_var = false
    params[:offlevel] = {} unless params[:offlevel]
    params[:offlevel].each do |k,v|
      if v == "1"
        case k
        when "twelve"
          arr << "12"
        when "eighteen"
          arr << "18"
        when "twentyfour"
          arr << "24"
        when "thirty"
          arr << "30"
        when "thirtysix"
          arr << "36"
        when "show_total_on_print"
          show_total_on_print_var = true
        end
      end
    end
    str = arr.join(",")
    Estimate.find(params[:offlevel][:estimate_id].to_i).update_attribute(:show_total_on_print, show_total_on_print_var)
    begin
      logger.debug("Estimate id: #{params[:offlevel][:estimate_id]} with str: #{str.inspect}")
      Estimate.find(params[:offlevel][:estimate_id].to_i).update_attribute(:off_level_to_show, str)
      redirect_to :back and return
    rescue Exception => e
      logger.debug("Problem: #{e.message}")
      redirect_to :back and return
    end
  end
end