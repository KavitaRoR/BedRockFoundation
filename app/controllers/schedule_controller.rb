class ScheduleController < ApplicationController
  
  def index
    @crews = Crew.find(:all)
    # @contracts = Contract.find(:all, conditions: {scheduled_date: (Time.now - 2.days)}, order: "scheduled_date ASC")
    @contracts = Contract.where("scheduled_date > ?", (Time.now - 2.days)).order("scheduled_date ASC")
    @queued_contracts = Contract.where(:scheduled_date => nil)
    # @schedule_days = ScheduleDay.find(:all, :include => [:contracts]).select{|d| (Date.parse(d.day) >= Date.today && (Date.parse(d.day) <= (Date.today + 10.days)))}
  end
  
  def get_queued_for_dropdown
    val = []
    Contract.where(:scheduled_date => nil).each do |c|
      val << [c.id, c.estimate.job.name]
    end
    render :json => val.to_json
  end
  
end
