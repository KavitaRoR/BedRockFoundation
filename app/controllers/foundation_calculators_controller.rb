class FoundationCalculatorsController < ApplicationController
  # GET /foundation_calculators
  # GET /foundation_calculators.json
  def index
    @foundation_calculators = FoundationCalculator.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @foundation_calculators }
    end
  end

  # GET /foundation_calculators/1
  # GET /foundation_calculators/1.json
  def show
    @foundation_calculator = FoundationCalculator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @foundation_calculator }
    end
  end

  # GET /foundation_calculators/new
  # GET /foundation_calculators/new.json
  def new
    @foundation_calculator = FoundationCalculator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @foundation_calculator }
    end
  end

  # GET /foundation_calculators/1/edit
  def edit
    @foundation_calculator = FoundationCalculator.find(params[:id])
  end

  # POST /foundation_calculators
  # POST /foundation_calculators.json
  def create
    @foundation_calculator = FoundationCalculator.new(params[:foundation_calculator])

    respond_to do |format|
      if @foundation_calculator.save
        format.html { redirect_to @foundation_calculator, notice: 'Foundation calculator was successfully created.' }
        format.json { render json: @foundation_calculator, status: :created, location: @foundation_calculator }
      else
        format.html { render action: "new" }
        format.json { render json: @foundation_calculator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /foundation_calculators/1
  # PUT /foundation_calculators/1.json
  def update
    @foundation_calculator = FoundationCalculator.find(params[:id])

    respond_to do |format|
      if @foundation_calculator.update_attributes(params[:foundation_calculator])
        format.html { redirect_to @foundation_calculator, notice: 'Foundation calculator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @foundation_calculator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foundation_calculators/1
  # DELETE /foundation_calculators/1.json
  def destroy
    @foundation_calculator = FoundationCalculator.find(params[:id])
    @foundation_calculator.destroy

    respond_to do |format|
      format.html { redirect_to foundation_calculators_url }
      format.json { head :no_content }
    end
  end
end
