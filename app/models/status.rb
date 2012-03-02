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
  
  
end
