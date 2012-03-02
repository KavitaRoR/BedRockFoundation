class FoundationsController < ApplicationController
  
  def index
    @foundations = Foundation.find(:all)
    session[:look] = 'index'
  end
  
  def show
    @foundation = Foundation.find(params[:id])
    session[:look] = 'show'
  end
  
  def new
    @foundation = Foundation.new
  end
  
  def create
    @foundation = Foundation.new(params[:foundation])
    if @foundation.save
      flash[:notice] = "Successfully created foundation."
      redirect_to foundations_url and return if params[:commit] == "Save"
      redirect_to new_foundation_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @foundation = Foundation.find(params[:id])
  end
  
  def update
    @foundation = Foundation.find(params[:id])
    if @foundation.update_attributes(params[:foundation])
      flash[:notice] = "Successfully updated foundation."
      redirect_to @foundation if session[:look] == 'show'
      redirect_to foundations_url if session[:look] == 'index'
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @foundation = Foundation.find(params[:id])
    @foundation.destroy
    flash[:notice] = "Successfully destroyed foundation."
    redirect_to foundations_url
  end
end
