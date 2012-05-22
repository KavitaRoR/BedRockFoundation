class ArrivalRangesController < ApplicationController
  # GET /arrival_ranges
  # GET /arrival_ranges.json
  def index
    @arrival_ranges = ArrivalRange.find(:all, :order => "position ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @arrival_ranges }
    end
  end
  
  def soon
    
  end

  # GET /arrival_ranges/1
  # GET /arrival_ranges/1.json
  def show
    @arrival_range = ArrivalRange.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @arrival_range }
    end
  end

  # GET /arrival_ranges/new
  # GET /arrival_ranges/new.json
  def new
    @arrival_range = ArrivalRange.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @arrival_range }
    end
  end

  # GET /arrival_ranges/1/edit
  def edit
    @arrival_range = ArrivalRange.find(params[:id])
  end

  # POST /arrival_ranges
  # POST /arrival_ranges.json
  def create
    @arrival_range = ArrivalRange.new(params[:arrival_range])

    respond_to do |format|
      if @arrival_range.save
        format.html { redirect_to @arrival_range, notice: 'Arrival range was successfully created.' }
        format.json { render json: @arrival_range, status: :created, location: @arrival_range }
      else
        format.html { render action: "new" }
        format.json { render json: @arrival_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /arrival_ranges/1
  # PUT /arrival_ranges/1.json
  def update
    @arrival_range = ArrivalRange.find(params[:id])

    respond_to do |format|
      if @arrival_range.update_attributes(params[:arrival_range])
        format.html { redirect_to @arrival_range, notice: 'Arrival range was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @arrival_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arrival_ranges/1
  # DELETE /arrival_ranges/1.json
  def destroy
    @arrival_range = ArrivalRange.find(params[:id])
    @arrival_range.destroy

    respond_to do |format|
      format.html { redirect_to arrival_ranges_url }
      format.json { head :no_content }
    end
  end
end
