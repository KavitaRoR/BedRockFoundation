class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def navigation 
    # render :template => false
  end
  
  def index 
    # @all_todos = Status.find(:all, :conditions => {:assigned_to => current_user.id, :done => nil}, :include => [:contact, :job, :next_action, {:contact => :jobs}], :order => "followup_date DESC")
    @all_todos = Status.todo(current_user.id)
    id_group = {}
    @all_todos.each do |t|
      if t.contact
        if id_group.has_key?(t.contact.id)
          id_group[t.contact.id] = t.id if id_group[t.contact.id] < t.id
        else
          id_group[t.contact.id] = t.id
        end
      end
    end
    @todos = []
    id_group.each do |k, v|
      @todos << Status.find(v, :include => [:contact, :job, :next_action, {:contact => :jobs}])
    end
  end
  
  def todos 
    @all_todos = Status.todo(current_user.id)
    id_group = {}
    @all_todos.each do |t|
      if t.contact
        if id_group.has_key?(t.contact.id)
          id_group[t.contact.id] = t.id if id_group[t.contact.id] < t.id
        else
          id_group[t.contact.id] = t.id
        end
      end
    end
    @todos = []
    id_group.each do |k, v|
      @todos << Status.find(v, :include => [:contact, :job, :next_action, {:contact => :jobs}])
    end
  end
  
  def clear_todo
    @status = Status.find(params[:id])
    @status.update_attribute "done", true
    redirect_to "/#todo"
  end
end
