class CrewsController < ApplicationController
  # GET /crews
  # GET /crews.json
  def index
    @crews = Crew.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @crews }
    end
  end

  # GET /crews/1
  # GET /crews/1.json
  def show
    @crew = Crew.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @crew }
    end
  end

  # GET /crews/new
  # GET /crews/new.json
  def new
    @crew = Crew.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @crew }
    end
  end

  # GET /crews/1/edit
  def edit
    @crew = Crew.find(params[:id])
  end

  # POST /crews
  # POST /crews.json
  def create
    @crew = Crew.new(params[:crew])

    respond_to do |format|
      if @crew.save
        format.html { redirect_to @crew, notice: 'Crew was successfully created.' }
        format.json { render json: @crew, status: :created, location: @crew }
      else
        format.html { render action: "new" }
        format.json { render json: @crew.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /crews/1
  # PUT /crews/1.json
  def update
    @crew = Crew.find(params[:id])

    respond_to do |format|
      if @crew.update_attributes(params[:crew])
        format.html { redirect_to @crew, notice: 'Crew was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @crew.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crews/1
  # DELETE /crews/1.json
  def destroy
    @crew = Crew.find(params[:id])
    @crew.destroy

    respond_to do |format|
      format.html { redirect_to crews_url }
      format.json { head :no_content }
    end
  end
end
