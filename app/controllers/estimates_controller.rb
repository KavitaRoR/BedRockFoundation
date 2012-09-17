class EstimatesController < ApplicationController
  before_filter :authenticate_user!, except: [:client_estimate]
  layout 'client', :only => [:client_estimate, :view_estimate]
  include WepayRails::Payments
  
  
  def email_estimate
    @job = Job.find(params[:id])
    begin
      if @job.job_calc_type == "adhoc" || @job.foundation_kind.downcase.include?("concrete")
        @estimate = Estimate.find(:last, :conditions => {:job_id => params[:id]})
        
      else
        @job_type = JobType.find(:first, conditions: {kind: params[:type].capitalize})
        @estimate = Estimate.find(:last, :conditions => {:job_id => params[:id], :job_type_id => @job_type.id})

        if !@estimate
          @estimate = Estimate.create(job_id: params[:id], job_type_id: @job_type.id, flashvars: @job.options_for_print(params[:type].capitalize).with_indifferent_access, token: SecureRandom.hex(6))
        end
      end
      
      @estimate.update_attribute(:date_of_email_to_client, Time.now)
      if EstimateMailer.send_to_contact(@estimate).deliver
        redirect_to :back, notice: "Mail Successfully sent to #{@estimate.job.contact.email}"
      else
        redirect_to :back, error: "Something went wrong emailing.  Try verifying the contact's email address."
      end
    rescue Exception => e
      @estimate.update_attribute(:date_of_email_to_client, Time.now)
      logger.info("Huge Problem Emailing estimate: #{e.message}")
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
    
    
      checkout_params_full = {
          :amount => 3,
          :short_description => "Short Description",
          :long_description => "Long Description",
          :mode => 'iframe'
      }
      @checkoutfull = init_checkout(checkout_params_full)

    if Rails.env.development?

      checkout_params_thirds = {
          :amount => 1,
          # :period   => 'monthly',
          # :end_time => '2013-12-25',
          # :mode     => 'regular',
          # :auto_recur  => true, 
          :short_description => "Short Description",
          :long_description => "Long Description",
          :mode => 'iframe'
      }
      @checkoutthirds = init_checkout(checkout_params_thirds)
    end
    
  end
  
  def view_estimate
    @estimate = Estimate.find_by_token(params[:token])    
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
      
      if @estimate.push_to_sold(@creator)
        redirect_to "/schedule", notice: "The job is on the production schedule."
      else 
        redirect_to :back, alert: "Something went terribly wrong.  Check the job data and try again."
      end
    rescue Exception => e
      logger.debug("Huge Problem: #{e.message}")
      redirect_to :back, alert: "An Error occurred."
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
        when "fourtyeight"
          arr << "48"
        when "sixty"
          arr << "60"
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