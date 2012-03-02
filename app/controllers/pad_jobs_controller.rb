class PadJobsController < ApplicationController
  
  def index
    @pad_jobs = PadJob.find(:all)
    session[:look] = 'index'
  end
  
  def show
    @pad_job = PadJob.find(params[:id])
    session[:look] = 'show'
  end
  
  def new
    @pad_job = PadJob.new
  end
  
  def create
    @pad_job = PadJob.new(params[:pad_job])
    if @pad_job.save
      flash[:notice] = "Successfully created padjob."
      redirect_to pad_jobs_url and return if params[:commit] == "Save"
      redirect_to new_pad_job_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @pad_job = PadJob.find(params[:id])
  end
  
  def update
    @pad_job = PadJob.find(params[:id])
    if @pad_job.update_attributes(params[:pad_job])
      flash[:notice] = "Successfully updated padjob."
      redirect_to @pad_job if session[:look] == 'show'
      redirect_to pad_jobs_url if session[:look] == 'index'
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @pad_job = PadJob.find(params[:id])
    @pad_job.destroy
    flash[:notice] = "Successfully destroyed padjob."
    redirect_to pad_jobs_url
  end
end
