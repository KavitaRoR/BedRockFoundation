class JobsController < ApplicationController
  before_filter :authenticate_user!
  
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
    @job_type = JobType.where(:kind => params[:type].capitalize).first
    @estimate = Estimate.find(:last, :conditions => {:job_id => params[:id], :job_type_id => @job_type.id})
    @options_for_job = @job.options_for_print((params[:type].capitalize rescue "Standard")).with_indifferent_access
    if !@estimate
      @estimate = Estimate.create(job_id: params[:id], job_type_id: @job_type.id, flashvars: @options_for_job, token: SecureRandom.hex(16))
    end
    
    @type = params[:type].capitalize
    session[:look] = 'print'
  end
  
  def print_modal
    @job = Job.find(params[:id])
    @job_type = JobType.where(:kind => params[:type].capitalize).first
    @estimate = Estimate.find(:last, :conditions => {:job_id => params[:id], :job_type_id => @job_type.id})
    @options_for_job = @job.options_for_print((params[:type].capitalize rescue "Standard")).with_indifferent_access
    if !@estimate
      @estimate = Estimate.create(job_id: params[:id], job_type_id: @job_type.id, flashvars: @options_for_job, token: SecureRandom.hex(16))
    end
    @estimate.job.statuses.last.update_attribute("done", true)
    @estimate.job.statuses.create({:notes => "Sold!", :assigned_by => current_user.id, :assigned_to => current_user.id, :done => true, :next_action_id => 7})
    @type = params[:type].capitalize
    
    render :layout => false
  end
  
  def foreman_print_modal
    @job = Job.find(params[:id])
    @job_type = JobType.where(:kind => params[:type].capitalize).first
    @estimate = Estimate.find(:last, :conditions => {:job_id => params[:id], :job_type_id => @job_type.id})
    @options_for_job = @job.options_for_print((params[:type].capitalize rescue "Standard")).with_indifferent_access
    if !@estimate
      @estimate = Estimate.create(job_id: params[:id], job_type_id: @job_type.id, flashvars: @options_for_job, token: SecureRandom.hex(16))
    end
    @estimate.job.statuses.last.update_attribute("done", true)
    @estimate.job.statuses.create({:notes => "Sold!", :assigned_by => current_user.id, :assigned_to => current_user.id, :done => true, :next_action_id => 7})
    @type = params[:type].capitalize
    
    render :layout => false
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
