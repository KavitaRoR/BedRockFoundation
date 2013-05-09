class Status < ActiveRecord::Base
  belongs_to :next_action
  belongs_to :job
  belongs_to :contact
  
  scope :reverse, :order => "updated_at DESC"
  
  def creator
    User.find(assigned_by)
  end
  
  def assignee
    User.find(assigned_to)
  end
  
  def self.todo(user_id)
    if user_id == 3
      find(:all, :conditions => {:done => nil,:assigned_to => user_id}, 
        :joins => [:contact, :job, :next_action, {:contact => :jobs}], 
        :order => "followup_date DESC")
    else
       find(:all, :conditions => {:done => nil}, 
        :include => [:contact, :job, :next_action, {:contact => :jobs}], 
        :order => "followup_date DESC")
    end       
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
