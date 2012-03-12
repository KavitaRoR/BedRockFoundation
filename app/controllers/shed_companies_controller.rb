class ShedCompaniesController < ApplicationController
  before_filter :authenticate_user!
  # GET /shed_companies
  # GET /shed_companies.json
  def index
    @shed_companies = ShedCompany.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shed_companies }
    end
  end

  # GET /shed_companies/1
  # GET /shed_companies/1.json
  def show
    @shed_company = ShedCompany.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shed_company }
    end
  end

  # GET /shed_companies/new
  # GET /shed_companies/new.json
  def new
    @shed_company = ShedCompany.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shed_company }
    end
  end

  # GET /shed_companies/1/edit
  def edit
    @shed_company = ShedCompany.find(params[:id])
  end

  # POST /shed_companies
  # POST /shed_companies.json
  def create
    @shed_company = ShedCompany.new(params[:shed_company])

    respond_to do |format|
      if @shed_company.save
        format.html { redirect_to @shed_company, notice: 'Shed company was successfully created.' }
        format.json { render json: @shed_company, status: :created, location: @shed_company }
      else
        format.html { render action: "new" }
        format.json { render json: @shed_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shed_companies/1
  # PUT /shed_companies/1.json
  def update
    @shed_company = ShedCompany.find(params[:id])

    respond_to do |format|
      if @shed_company.update_attributes(params[:shed_company])
        format.html { redirect_to @shed_company, notice: 'Shed company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shed_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shed_companies/1
  # DELETE /shed_companies/1.json
  def destroy
    @shed_company = ShedCompany.find(params[:id])
    @shed_company.destroy

    respond_to do |format|
      format.html { redirect_to shed_companies_url }
      format.json { head :no_content }
    end
  end
end
