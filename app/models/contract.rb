class Contract < ActiveRecord::Base
  belongs_to :estimate
  belongs_to :schedule_day
  belongs_to :crew
  
  before_create :check_schedule
  
  
  protected
  
  def check_schedule
    ScheduleDay.new.instantiate_day!
    crews = Crew.all
    14.times do |i|
      day_instance = (Time.now + i.days).strftime("%Y-%m-%d")
      db_day = ScheduleDay.find_by_day(day_instance)
      crews.each do |crew|
        crew_jobs_on_day = Contract.where({crew_id: crew.id, schedule_day_id: db_day.id})
        if crew_jobs_on_day.count < crew.job_max_per_day
          puts "Go on Crew: #{self.id} to crew: #{crew.id}"
          # self.crew_id = crew.id
          # self.schedule_day_id = db_day.id
          # self.position_in_day = crew_jobs_on_day.count + 1
          return true
        end
      end  
    end
    return true 
  end
end
