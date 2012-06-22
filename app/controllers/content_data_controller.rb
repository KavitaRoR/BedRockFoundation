class ContentDataController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /content_data
  # GET /content_data.json
  def index
    @content_data = ContentDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @content_data }
    end
  end

  # GET /content_data/1
  # GET /content_data/1.json
  def show
    @content_datum = ContentDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content_datum }
    end
  end

  # GET /content_data/new
  # GET /content_data/new.json
  def new
    @content_datum = ContentDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content_datum }
    end
  end

  # GET /content_data/1/edit
  def edit
    @content_datum = ContentDatum.find(params[:id])
  end

  # POST /content_data
  # POST /content_data.json
  def create
    @content_datum = ContentDatum.new(params[:content_datum])

    respond_to do |format|
      if @content_datum.save
        format.html { redirect_to @content_datum, notice: 'Content datum was successfully created.' }
        format.json { render json: @content_datum, status: :created, location: @content_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @content_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /content_data/1
  # PUT /content_data/1.json
  def update
    @content_datum = ContentDatum.find(params[:id])

    respond_to do |format|
      if @content_datum.update_attributes(params[:content_datum])
        format.html { redirect_to @content_datum, notice: 'Content datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_data/1
  # DELETE /content_data/1.json
  def destroy
    @content_datum = ContentDatum.find(params[:id])
    @content_datum.destroy

    respond_to do |format|
      format.html { redirect_to content_data_url }
      format.json { head :no_content }
    end
  end
end
