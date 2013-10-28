class MapsController < ApplicationController
  layout "maps"

  def google 
    @q = params[:q]
  end

end