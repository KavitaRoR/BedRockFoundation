class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def navigation 
    # render :template => false
  end
  
  def index 
    @todos = Status.find(:all, :conditions => {:assigned_to => current_user.id}, :order => "followup_date DESC")
    logger.debug("User ID: #{current_user.id}")
    logger.debug("ToDo count: #{@todos.count rescue @todos.length}")
  end
  
  def clear_todo
    @status = Status.find(params[:id])
    @status.update_attribute "done", true
    redirect_to "/#todo"
  end
end
