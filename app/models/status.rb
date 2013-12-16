class Status < ActiveRecord::Base
  belongs_to :next_action
  belongs_to :job
  belongs_to :contact

  after_create :remove_from_dash
  
  scope :reverse, :order => "updated_at DESC"
  
  def creator
    @creator ||= User.find(assigned_by)
  end
  
  def assignee
    @assignee ||= User.find(assigned_to)
  end

  
  def self.todo_for(user_id)
    where(:done => nil).where("next_action_id in (?)", NextAction.for_todo.pluck(:id)).includes(:next_action).order("followup_date DESC")
  end

  def self.todos
    where(:done => nil).where("next_action_id in (?)", NextAction.for_todo.pluck(:id)).includes(:next_action).order("followup_date DESC")
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

  protected

  def remove_from_dash
    if next_action_id == 5 || next_action_id == 7
      Status.where(:contact_id => self.contact_id).each do |s|
        s.done = true
        s.save
      end
    end
  end
  
  
end
