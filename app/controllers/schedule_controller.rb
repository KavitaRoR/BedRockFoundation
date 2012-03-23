class ScheduleController < ApplicationController
  
  def index
    @crews = Crew.find(:all, :include => [:contracts, {:contracts => :estimate}], :order => "ordering ASC")
    @contracts = Contract.where("scheduled_date > ?", (Time.now - 2.days)).includes(:estimate, {:estimate => :job}).order("scheduled_date ASC")
    @queued_contracts = Contract.where(:scheduled_date => nil)
  end
  
  def get_queued_for_dropdown
    val = []
    Contract.where(:scheduled_date => nil).each do |c|
      val << [c.id, c.estimate.job.name]
    end
    render :json => val.to_json
  end
  
  def persist_assignment
    logger.debug(params.inspect)
    contract = Contract.find(params[:contract_id])
    
    if contract
      # if Contract.find(:all, :conditions => { crew_id: params[:crew_id], position_in_day})
      if contract.update_attributes({ crew_id: params[:crew_id], position_in_day: params[:position], scheduled_date: Time.at(params[:day].to_i) })
        render :json => { conName: contract.name, location: contract.location }
      else
        render :text => false
      end
    else
      render :text => false
    end
  end

  def remove_assignment
    contract = Contract.find(params[:id])
    if contract
      if contract.update_attributes({ crew_id: nil, position_in_day: nil, scheduled_date: nil })
        render :text => true
      else
        render :text => false
      end
    else
      render :text => false
    end
  end
  
  def redirect_to_contact
    contract = Contract.find(params[:id])
    if contract && contract.estimate.job.contact
      redirect_to contact_url(contract.estimate.job.contact)
    else
      redirect_to "/schedule", error: "The contact was not found"
    end
  end

  def printable
    @query_future_date = parse_date_until(params[:until]) || (Date.today + 2.weeks)
    @crews = if params[:crew].nil?
      Crew.find(:all, :include => [:contracts, {:contracts => :estimate}], :order => "ordering ASC")
    else
      Crew.find(:all, :conditions => ["id = ?", params[:crew]], :include => [:contracts, {:contracts => :estimate}], :order => "ordering ASC")
    end
    @contracts = Contract.where("scheduled_date > ?", (Time.now - 1.day)).includes(:estimate, {:estimate => :job}).order("scheduled_date ASC")
  end


  def parse_date_until(string_date)
    return false if string_date.nil?
    qty = string_date.split(".").first.to_i
    span = string_date.split(".").last
    days = case span
    when "d"
      1
    when "w"
      7
    when "m"
      30
    end
    return Date.today + (days*qty).days
  end
end
