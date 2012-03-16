class ScheduleController < ApplicationController
  
  def index
    @crews = Crew.find(:all, :include => [:contracts, {:contracts => :schedule_day}])
    @schedule_days = ScheduleDay.find(:all, :include => [:contracts]).select{|d| (Date.parse(d.day) >= Date.today && (Date.parse(d.day) <= (Date.today + 30.days)))}
  end
  
end
