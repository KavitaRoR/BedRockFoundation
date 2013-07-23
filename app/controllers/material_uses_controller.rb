class MaterialUsesController < ApplicationController
  # GET /material_uses
  # GET /material_uses.json
  def index
    @material_uses = MaterialUse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @material_uses }
    end
  end

  # GET /material_uses/1
  # GET /material_uses/1.json
  def show
    @material_use = MaterialUse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @material_use }
    end
  end

  # GET /material_uses/new
  # GET /material_uses/new.json
  def new
    @material_use = MaterialUse.new(:job_id => params[:job_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @material_use }
    end
  end

  # GET /material_uses/1/edit
  def edit
    @material_use = MaterialUse.find(params[:id])
  end

  # POST /material_uses
  # POST /material_uses.json
  def create
    @material_use = MaterialUse.new(params[:material_use])

    respond_to do |format|
      if @material_use.save
        format.html { redirect_to "/jobs/#{@material_use.job.id}/edit", notice: 'Material addition was successfully created.' }
        format.json { render json: @material_use, status: :created, location: @material_use }
      else
        format.html { render action: "new" }
        format.json { render json: @material_use.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /material_uses/1
  # PUT /material_uses/1.json
  def update
    @material_use = MaterialUse.find(params[:id])

    respond_to do |format|
      if @material_use.update_attributes(params[:material_use])
        format.html { redirect_to "/jobs/#{@material_use.job.id}/edit", notice: 'Material addition was successfully saved.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @material_use.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_uses/1
  # DELETE /material_uses/1.json
  def destroy
    @material_use = MaterialUse.find(params[:id])
    job = @material_use.job.id
    @material_use.destroy

    respond_to do |format|
        format.html { redirect_to "/jobs/#{job}/edit", notice: 'Material addition was successfully removed.' }
      format.json { head :no_content }
    end
  end
end
