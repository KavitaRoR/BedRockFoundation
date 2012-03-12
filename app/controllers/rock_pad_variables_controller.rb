class RockPadVariablesController < ApplicationController
  before_filter :authenticate_user!
  # GET /rock_pad_variables
  # GET /rock_pad_variables.xml
  def index
    # Cant do a SQL/Active Record :order in the find because of the name 'key'.  Reserved!
    @rock_pad_variables = RockPadVariable.find(:all).sort_by {|k| k.key }

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rock_pad_variables }
    end
  end

  # GET /rock_pad_variables/1
  # GET /rock_pad_variables/1.xml
  def show
    @rock_pad_variable = RockPadVariable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rock_pad_variable }
    end
  end

  # GET /rock_pad_variables/new
  # GET /rock_pad_variables/new.xml
  def new
    @rock_pad_variable = RockPadVariable.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rock_pad_variable }
    end
  end

  # GET /rock_pad_variables/1/edit
  def edit
    @rock_pad_variable = RockPadVariable.find(params[:id])
  end

  # POST /rock_pad_variables
  # POST /rock_pad_variables.xml
  def create
    @rock_pad_variable = RockPadVariable.new(params[:rock_pad_variable])

    respond_to do |format|
      if @rock_pad_variable.save
        flash[:notice] = 'RockPadVariable was successfully created.'
        format.html { redirect_to(@rock_pad_variable) }
        format.xml  { render :xml => @rock_pad_variable, :status => :created, :location => @rock_pad_variable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rock_pad_variable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rock_pad_variables/1
  # PUT /rock_pad_variables/1.xml
  def update
    @rock_pad_variable = RockPadVariable.find(params[:id])

    respond_to do |format|
      if @rock_pad_variable.update_attributes(params[:rock_pad_variable])
        flash[:notice] = 'RockPadVariable was successfully updated.'
        format.html { redirect_to(@rock_pad_variable) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rock_pad_variable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rock_pad_variables/1
  # DELETE /rock_pad_variables/1.xml
  def destroy
    @rock_pad_variable = RockPadVariable.find(params[:id])
    @rock_pad_variable.destroy

    respond_to do |format|
      format.html { redirect_to(rock_pad_variables_url) }
      format.xml  { head :ok }
    end
  end
end
