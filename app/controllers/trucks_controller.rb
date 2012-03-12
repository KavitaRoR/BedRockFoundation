class TrucksController < ApplicationController
  before_filter :authenticate_user!
  def index
    @trucks = Truck.find(:all)
    session[:look] = 'index'
  end
  
  def show
    @truck = Truck.find(params[:id])
    session[:look] = 'show'
  end
  
  def new
    @truck = Truck.new
  end
  
  def create
    @truck = Truck.new(params[:truck])
    if @truck.save
      flash[:notice] = "Successfully created truck."
      redirect_to trucks_url and return if params[:commit] == "Save"
      redirect_to new_truck_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @truck = Truck.find(params[:id])
  end
  
  def update
    @truck = Truck.find(params[:id])
    if @truck.update_attributes(params[:truck])
      flash[:notice] = "Successfully updated truck."
      redirect_to @truck if session[:look] == 'show'
      redirect_to trucks_url if session[:look] == 'index'
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @truck = Truck.find(params[:id])
    @truck.destroy
    flash[:notice] = "Successfully destroyed truck."
    redirect_to trucks_url
  end
end
