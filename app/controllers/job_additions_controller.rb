class JobAdditionsController < ApplicationController
  # GET /job_additions
  # GET /job_additions.json
  def index
    @job_additions = JobAddition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @job_additions }
    end
  end

  # GET /job_additions/1
  # GET /job_additions/1.json
  def show
    @job_addition = JobAddition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job_addition }
    end
  end

  # GET /job_additions/new
  # GET /job_additions/new.json
  def new
    @job_id = params[:job_id]
    @job_addition = JobAddition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job_addition }
    end
  end

  # GET /job_additions/1/edit
  def edit
    @job_addition = JobAddition.find(params[:id])
  end

  # POST /job_additions
  # POST /job_additions.json
  def create
    params[:job_addition][:addition_price_in_cents] = params[:job_addition][:addition_price_in_cents].to_f * 100
    @job_addition = JobAddition.new(params[:job_addition])

    respond_to do |format|
      if @job_addition.save
        format.html { redirect_to "/jobs/#{@job_addition.job_id}/edit", notice: 'Job addition was successfully created.' }
        format.json { render json: @job_addition, status: :created, location: @job_addition }
      else
        format.html { render action: "new" }
        # format.json { render json: @job_addition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /job_additions/1
  # PUT /job_additions/1.json
  def update
    @job_addition = JobAddition.find(params[:id])

    respond_to do |format|
      if @job_addition.update_attributes(params[:job_addition])
        format.html { redirect_to @job_addition, notice: 'Job addition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job_addition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_additions/1
  # DELETE /job_additions/1.json
  def destroy
    @job_addition = JobAddition.find(params[:id])
    @job_addition.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
