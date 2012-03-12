class CampaignsController < ApplicationController
  before_filter :authenticate_user!  
  def index
    @campaigns = Campaign.find(:all)
    session[:look] = 'index'
  end
  
  def show
    @campaign = Campaign.find(params[:id])
    session[:look] = 'show'
  end
  
  def new
    @campaign = Campaign.new
  end
  
  def create
    @campaign = Campaign.new(params[:campaign])
    if @campaign.save
      flash[:notice] = "Successfully created campaign."
      redirect_to campaigns_url and return if params[:commit] == "Save"
      redirect_to new_campaign_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @campaign = Campaign.find(params[:id])
  end
  
  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(params[:campaign])
      flash[:notice] = "Successfully updated campaign."
      redirect_to @campaign if session[:look] == 'show'
      redirect_to campaigns_url if session[:look] == 'index'
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    flash[:notice] = "Successfully destroyed campaign."
    redirect_to campaigns_url
  end
end
