class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  before_filter :require_admin
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    logger.debug("In My Create")
    @user = User.new(params[:user])
    if @user.save
      permissions = []
      if params[:permissions_level_admin]
        permissions << "Admin"
      end
      if params[:permissions_level_foreman]
        permissions << "Crew Foreman"
      end
      @user.update_attribute(:permissions_levels, permissions.join(","))
      redirect_to "/users"
    else
      redirect_to :back
    end
  end
  
  def become
    return unless current_user
    begin
      if params[:id]
        session[:spoof_user_id] = params[:id]
      else
        session[:spoof_user_id] = nil
      end
      redirect_to :back
    rescue
      redirect_to "/users", :error => "Becoming someone else did not work"
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    logger.debug("In update")
    begin
      @user.update_attributes(params[:user])
      permissions = []
      if params[:permissions_level_admin]
        permissions << "Admin"
      end
      if params[:permissions_level_foreman]
        permissions << "Crew Foreman"
      end
      logger.debug("PERMISSIONS : #{permissions.join(",")}")
      @user.update_attribute(:permissions_levels, permissions.join(","))
      redirect_to :action => :index
    rescue Exception => e
      logger.debug("Something Failed : #{e.message}")
      redirect_to :back
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    
    if @user.destroy
      redirect_to :action => :index
    else
      redirect_to :back
    end
  end
end