class ScheduleController < ApplicationController
  
  def index
    @crews = Crew.find(:all)
    @contracts = Contract.where("scheduled_date > ?", Time.now - 2.days).order("scheduled_date ASC")
    @queued_contracts = Contract.where(:scheduled_date => nil)
    # @schedule_days = ScheduleDay.find(:all, :include => [:contracts]).select{|d| (Date.parse(d.day) >= Date.today && (Date.parse(d.day) <= (Date.today + 10.days)))}
  end
  
end
