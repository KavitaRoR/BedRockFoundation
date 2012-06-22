class StatusesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @statuses = Status.find(:all)
    session[:look] = 'index'
  end
  
  def show
    @status = Status.find(params[:id])
    session[:look] = 'show'
  end
  
  def new
    @status = Status.new
    @jobs = Job.all
  end
  
  def create
    @status = Status.new(params[:status])
    if @status.save      
      flash[:notice] = "Successfully created status."
      redirect_to @status.job.contact and return if @status.job
      redirect_to @status.contact
    else
      render :action => 'new'
    end
  end
  
  def edit
    @status = Status.find(params[:id])
    @jobs = Job.all
  end
  
  def update
    @status = Status.find(params[:id])
    if @status.update_attributes(params[:status])
      flash[:notice] = "Successfully updated status."
      redirect_to @status if session[:look] == 'show'
      redirect_to statuses_url if session[:look] == 'index'
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    flash[:notice] = "Successfully destroyed status."
    redirect_to statuses_url
  end
end
