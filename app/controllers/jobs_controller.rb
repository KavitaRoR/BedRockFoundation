class JobsController < ApplicationController
  
  def index
    @jobs = Job.find(:all)
    session[:look] = 'index'
  end
  
  def show
    @job = Job.find(params[:id])
    session[:look] = 'show'
  end

  def print
    @job = Job.find(params[:id])
    session[:look] = 'print'
  end
  
  def new
    @job = Job.new
  end
  
  def create
    @job = Job.new(params[:job])
    @job.creator = current_user
    if @job.save
      flash[:notice] = "Successfully created job."
      redirect_to @job.contact
    else
      render :action => 'new'
    end
  end
  
  def edit
    @job = Job.find(params[:id])
  end
  
  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      flash[:notice] = "Successfully updated job."
      redirect_to @job.contact
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:notice] = "Successfully destroyed job."
    redirect_to @job.contact and return if @job.contact
    redirect_to "/jobs"
  end
end
