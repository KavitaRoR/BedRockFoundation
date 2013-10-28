class MaterialQuantityLabelsController < ApplicationController
  # GET /material_quantity_labels
  # GET /material_quantity_labels.json
  def index
    @material_quantity_labels = MaterialQuantityLabel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @material_quantity_labels }
    end
  end

  # GET /material_quantity_labels/1
  # GET /material_quantity_labels/1.json
  def show
    @material_quantity_label = MaterialQuantityLabel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @material_quantity_label }
    end
  end

  # GET /material_quantity_labels/new
  # GET /material_quantity_labels/new.json
  def new
    @material_quantity_label = MaterialQuantityLabel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @material_quantity_label }
    end
  end

  # GET /material_quantity_labels/1/edit
  def edit
    @material_quantity_label = MaterialQuantityLabel.find(params[:id])
  end

  # POST /material_quantity_labels
  # POST /material_quantity_labels.json
  def create
    @material_quantity_label = MaterialQuantityLabel.new(params[:material_quantity_label])

    respond_to do |format|
      if @material_quantity_label.save
        format.html { redirect_to @material_quantity_label, notice: 'Material quantity label was successfully created.' }
        format.json { render json: @material_quantity_label, status: :created, location: @material_quantity_label }
      else
        format.html { render action: "new" }
        format.json { render json: @material_quantity_label.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /material_quantity_labels/1
  # PUT /material_quantity_labels/1.json
  def update
    @material_quantity_label = MaterialQuantityLabel.find(params[:id])

    respond_to do |format|
      if @material_quantity_label.update_attributes(params[:material_quantity_label])
        format.html { redirect_to @material_quantity_label, notice: 'Material quantity label was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @material_quantity_label.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_quantity_labels/1
  # DELETE /material_quantity_labels/1.json
  def destroy
    @material_quantity_label = MaterialQuantityLabel.find(params[:id])
    @material_quantity_label.destroy

    respond_to do |format|
      format.html { redirect_to material_quantity_labels_url }
      format.json { head :no_content }
    end
  end
end
