class ReportsController < ApplicationController
  def index
    @campaigns = Campaign.order( :name ).uniq.collect{ |c| [c.name, c.id] }
    # @campaigns[0] = ["All", 0]
  end

  def search
    @campaigns = Campaign.search( params )
    respond_to do |format|
      format.js
    end
  end

  def customers
  	@campaign_id = params[:id]
  	@customer_list = Contact.where( "campaign_id = ?", params[:id] )
  	respond_to do |format|
  		format.js
  	end
  end
end
