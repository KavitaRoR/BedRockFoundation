class QuarriesController < ApplicationController
	before_filter :authenticate_user!
  # GET /quarries
  # GET /quarries.json
  def index
    @quarries = Quarry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quarries }
    end
  end

  # GET /quarries/1
  # GET /quarries/1.json
  def show
    @quarry = Quarry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quarry }
    end
  end

  # GET /quarries/new
  # GET /quarries/new.json
  def new
    @quarry = Quarry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quarry }
    end
  end

  # GET /quarries/1/edit
  def edit
    @quarry = Quarry.find(params[:id])
  end

  # POST /quarries
  # POST /quarries.json
  def create
    @quarry = Quarry.new(params[:quarry])

    respond_to do |format|
      if @quarry.save
        format.html { redirect_to @quarry, notice: 'Quarry was successfully created.' }
        format.json { render json: @quarry, status: :created, location: @quarry }
      else
        format.html { render action: "new" }
        format.json { render json: @quarry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quarries/1
  # PUT /quarries/1.json
  def update
    @quarry = Quarry.find(params[:id])

    respond_to do |format|
      if @quarry.update_attributes(params[:quarry])
        format.html { redirect_to @quarry, notice: 'Quarry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quarry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quarries/1
  # DELETE /quarries/1.json
  def destroy
    @quarry = Quarry.find(params[:id])
    @quarry.destroy

    respond_to do |format|
      format.html { redirect_to quarries_url }
      format.json { head :no_content }
    end
  end
end
