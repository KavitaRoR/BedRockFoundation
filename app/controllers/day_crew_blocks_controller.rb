class DayCrewBlocksController < ApplicationController
  # GET /day_crew_blocks
  # GET /day_crew_blocks.json
  def index
    @day_crew_blocks = DayCrewBlock.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @day_crew_blocks }
    end
  end

  # GET /day_crew_blocks/1
  # GET /day_crew_blocks/1.json
  def show
    @day_crew_block = DayCrewBlock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @day_crew_block }
    end
  end

  # GET /day_crew_blocks/new
  # GET /day_crew_blocks/new.json
  def new
    @day_crew_block = DayCrewBlock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @day_crew_block }
    end
  end

  # GET /day_crew_blocks/1/edit
  def edit
    @day_crew_block = DayCrewBlock.find(params[:id])
  end

  # POST /day_crew_blocks
  # POST /day_crew_blocks.json
  def create
    @day_crew_block = DayCrewBlock.new(params[:day_crew_block])

    respond_to do |format|
      if @day_crew_block.save
        format.html { redirect_to :back, notice: 'Day crew block was successfully created.' }
        format.json { render json: @day_crew_block, status: :created, location: @day_crew_block }
      else
        format.html { render action: "new" }
        format.json { render json: @day_crew_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /day_crew_blocks/1
  # PUT /day_crew_blocks/1.json
  def update
    @day_crew_block = DayCrewBlock.find(params[:id])

    respond_to do |format|
      if @day_crew_block.update_attributes(params[:day_crew_block])
        format.html { redirect_to :back, notice: 'Day crew block was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @day_crew_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /day_crew_blocks/1
  # DELETE /day_crew_blocks/1.json
  def destroy
    @day_crew_block = DayCrewBlock.find(params[:id])
    @day_crew_block.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end