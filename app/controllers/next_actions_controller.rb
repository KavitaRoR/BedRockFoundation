class NextActionsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @next_actions = NextAction.find(:all)
    session[:look] = 'index'
  end
  
  def show
    @next_action = NextAction.find(params[:id])
    session[:look] = 'show'
  end
  
  def new
    @next_action = NextAction.new
  end
  
  def create
    @next_action = NextAction.new(params[:next_action])
    if @next_action.save
      flash[:notice] = "Successfully created nextaction."
      redirect_to next_actions_url and return if params[:commit] == "Save"
      redirect_to new_next_action_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @next_action = NextAction.find(params[:id])
  end
  
  def update
    @next_action = NextAction.find(params[:id])
    if @next_action.update_attributes(params[:next_action])
      flash[:notice] = "Successfully updated nextaction."
      redirect_to @next_action if session[:look] == 'show'
      redirect_to next_actions_url if session[:look] == 'index'
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @next_action = NextAction.find(params[:id])
    @next_action.destroy
    flash[:notice] = "Successfully destroyed nextaction."
    redirect_to next_actions_url
  end
end
