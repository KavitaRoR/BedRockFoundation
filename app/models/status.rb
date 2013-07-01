class Status < ActiveRecord::Base
  belongs_to :next_action
  belongs_to :job
  belongs_to :contact
  
  scope :reverse, :order => "updated_at DESC"
  
  def creator
    @creator ||= User.find(assigned_by)
  end
  
  def assignee
    @assignee ||= User.find(assigned_to)
  end
  
  def self.todo(user_id)
    logger.debug("USER ID: #{user_id}")
    query = where(:done => nil).includes(:next_action).order("followup_date DESC")
    # query = query.where(assigned_to: user_id) unless [1,2,7,nil].include?(user_id)
    query
  end

  def status_flag
    flag = ""
    if (Time.now).beginning_of_day >= self.followup_date.beginning_of_day
      flag = "Past"
    elsif (Time.now).beginning_of_day + 1.day >= self.followup_date.beginning_of_day
      flag = "Today"
    end
    flag
  end
  
  
end
