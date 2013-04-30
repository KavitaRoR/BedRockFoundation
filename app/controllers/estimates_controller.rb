class EstimatesController < ApplicationController
  before_filter :authenticate_user!, except: [:client_estimate]
  layout 'client', :only => [:client_estimate, :view_estimate]
  include WepayRails::Payments

  def list

  end
    
  def index
    respond_to do |format|
      format.html
      format.json { render json: EstimatesDatatable.new(view_context) }
    end
  end
  
  def email_estimate
    @job = Job.find(params[:job_id])
    begin
      if @job.job_calc_type == "adhoc" || @job.foundation_kind.downcase.include?("concrete")
        @estimate = Estimate.find(:last, :conditions => {:job_id => params[:job_id]})
        
      else
        @job_type = JobType.find(:first, conditions: {kind: params[:type].capitalize})
        @estimate = Estimate.find(:last, :conditions => {:job_id => params[:job_id], :job_type_id => @job_type.id})

        if !@estimate
          @estimate = Estimate.create(job_id: params[:job_id], job_type_id: @job_type.id, flashvars: @job.options_for_print(params[:type].capitalize).with_indifferent_access, token: SecureRandom.hex(6))
        end
      end
      
      @estimate.update_attribute(:date_of_email_to_client, Time.now)
      if EstimateMailer.send_to_contact( @estimate, params ).deliver
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
    
    wepay_vars
    
  end
  
  
  def wepay_vars
    price_in_cents = if @job.job_type.kind == @type || @job.job_calc_type == "adhoc" || @job.foundation_kind.downcase.include?("concrete")
		  @job.price_in_cents
	  else
	    @job.price_in_cents + @job.specific_offlevel(@type)[:zero][0] - @job.specific_offlevel(@job.job_type.kind)[:zero][0]
    end
    price_in_cents += @job.bundle_total
    
    @price = price_in_cents.to_f / 100
    paid_so_far = 0
    for wcr in @estimate.wepay_checkout_records.select{|w| w.state == "captured" || w.state == "authorized"} 
      paid_so_far += wcr.amount
    end
    
    @recurring_price = "%.2f" % (@price.ceil.to_f * 1.0 * 0.5)
    
    if ((@price - paid_so_far) > 1)
    
      checkout_params_full = {
          :amount => @price - paid_so_far,
          :short_description => "Short Description",
          :long_description => "Long Description",
          :reference_id => @estimate.id,
          :mode => 'iframe'
      }
      @checkoutfull = init_checkout(checkout_params_full)


      checkout_params_thirds = {
          :amount => @recurring_price,
          # :period   => 'monthly',
          # :end_time => '2013-12-25',
          # :mode     => 'regular',
          # :auto_recur  => true, 
          :short_description => "Short Description",
          :long_description => "Long Description",
          :reference_id => @estimate.id,
          :mode => 'iframe'
      }
      @checkoutthirds = init_checkout(checkout_params_thirds)
      @payment_buttons = true
    else
      @payment_buttons = false
    end
  end

  def pay_estimate
    @estimate = Estimate.find_by_token(params[:estimate][:token])
      if @estimate.save_payment( params )
        redirect_to "/estimates/client_estimate/#{params[:estimate][:token]}?type=#{@estimate.job_type.kind}", notice: "Payment entered Successfully!"
      else
        redirect_to "/estimates/client_estimate/#{params[:estimate][:token]}?type=#{@estimate.job_type.kind}", notice: "Unable to save payment"
      end
  end
  
  
  def view_estimate
    @estimate = Estimate.find_by_token(params[:token])    
    @job = @estimate.job
    @job_type = @estimate.job_type
    @options_for_job = YAML::load(@estimate.flashvars).with_indifferent_access
    @type = @estimate.job_type.kind
    session[:return_to] = "/estimates/view_estimate/#{params[:token]}?type=#{@type}"
    wepay_vars
  end

  def add_note
    @estimate = Estimate.find_by_token( params[:estimate][:token] )
    @estimate.additional_notes = params[:estimate][:additional_notes]
    @estimate.save
    respond_to do |format|
      format.js
    end
  end

  def view_notes
    @estimate = Estimate.find_by_token( params[:token] )
    @notes = @estimate.additional_notes
    render layout: 'client'
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
    show_payment_buttons_var = false
    show_recurring_payment_var = false
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
        when "show_recurring_payment"
          show_recurring_payment_var = true
        when "show_payment_buttons"
          show_payment_buttons_var = true
        end
      end
    end
    str = arr.join(",")
    Estimate.find(params[:offlevel][:estimate_id].to_i).update_attribute(:show_total_on_print, show_total_on_print_var)
    Estimate.find(params[:offlevel][:estimate_id].to_i).update_attribute(:show_recurring_payment, show_recurring_payment_var)
    Estimate.find(params[:offlevel][:estimate_id].to_i).update_attribute(:show_payment_buttons, show_payment_buttons_var)
    
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