class Purchase::FinalizeController < ApplicationController
  def index
    # Fetch the WepayCheckoutRecord that was stored for the checkout
    wcr  = WepayCheckoutRecord.find_by_checkout_id(params[:checkout_id])

    # Example: Set the association of the wepay checkout record to my cart - then, on to order.
    @estimate = Estimate.find(wcr.reference_id)

    # Convert cart to an order?? Move to observer of WepayCheckoutRecord??
    # cart.convert_cart_to_order if wcr.state == 'authorized'
    
    flash[:notice] = "You have successfully made a payment."
    
    redirect_to "/e/#{@estimate.token}?type=#{estimate.job.job_type.kind}"
  end
end