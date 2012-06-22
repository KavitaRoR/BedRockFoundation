class JobAdditionsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @job_additions = JobAddition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @job_additions }
    end
  end

  def show
    @job_addition = JobAddition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job_addition }
    end
  end

  def new
    @job_id = params[:job_id]
    @job_addition = JobAddition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job_addition }
    end
  end

  def edit
    @job_addition = JobAddition.find(params[:id])
    @job_addition.addition_price_in_cents = @job_addition.addition_price_in_cents.to_f / 100
  end

  def create
    params[:job_addition][:addition_price_in_cents] = params[:job_addition][:addition_price_in_cents].to_f * 100
    @job_addition = JobAddition.new(params[:job_addition])

    respond_to do |format|
      if @job_addition.save
        format.html { redirect_to "/jobs/#{@job_addition.job_id}/edit", notice: 'Job addition was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    params[:job_addition][:addition_price_in_cents] = params[:job_addition][:addition_price_in_cents].to_f * 100
    @job_addition = JobAddition.find(params[:id])

    respond_to do |format|
      if @job_addition.update_attributes(params[:job_addition])
        logger.debug("Here friend: #{@job_addition.inspect}")
        format.html { redirect_to "/jobs/#{@job_addition.job_id}/edit", notice: 'Job addition was successfully created.' }
      else
        format.html { redirect_to "/jobs/#{@job_addition.job_id}/edit" }
      end
    end
  end

  def destroy
    @job_addition = JobAddition.find(params[:id])
    @job_addition.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
