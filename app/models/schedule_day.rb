class ScheduleDay < ActiveRecord::Base
  has_many :contracts
  
  def instantiate_day!
    90.times do |i|
      day_instance = (Time.now + i.days).strftime("%Y-%m-%d")
      db_day = ScheduleDay.find_by_day(day_instance)
      
      if !db_day
        db_day = ScheduleDay.create({:day => day_instance})
      end
    end
  end
end
