class Contract < ActiveRecord::Base
  belongs_to :estimate
  # belongs_to :schedule_day
  belongs_to :crew
  belongs_to :arrival_range
  
  # before_create :check_schedule

  before_save :persist_scheduled_date

  after_save :persist_estimate
  before_destroy :remove_from_firebase

  def name
    self.estimate.job.name
  end

  def location
    self.estimate.job.city_state
  end

  def persist_scheduled_date
    if scheduled_date
      estimate.job.current_scheduled_at = scheduled_date.beginning_of_day
      if estimate.job.originally_scheduled_at
        estimate.job.originally_scheduled_at = estimate.job.current_scheduled_at
      end
      estimate.job.save
    end
  end
  

  
  protected

  def persist_estimate
    estimate.save
  end

  def remove_from_firebase
    estimate.remove_from_firebase
  end
  
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
