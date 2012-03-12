class PadSizesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @pad_sizes = PadSize.find(:all)
    session[:look] = 'index'
  end
  
  def show
    @pad_size = PadSize.find(params[:id])
    session[:look] = 'show'
  end
  
  def new
    @pad_size = PadSize.new
  end
  
  def create
    @pad_size = PadSize.new(params[:pad_size])
    if @pad_size.save
      flash[:notice] = "Successfully created padsize."
      redirect_to pad_sizes_url and return if params[:commit] == "Save"
      redirect_to new_pad_size_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @pad_size = PadSize.find(params[:id])
  end
  
  def update
    @pad_size = PadSize.find(params[:id])
    if @pad_size.update_attributes(params[:pad_size])
      flash[:notice] = "Successfully updated padsize."
      redirect_to @pad_size if session[:look] == 'show'
      redirect_to pad_sizes_url if session[:look] == 'index'
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @pad_size = PadSize.find(params[:id])
    @pad_size.destroy
    flash[:notice] = "Successfully destroyed padsize."
    redirect_to pad_sizes_url
  end
end
