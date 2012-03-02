class ApplicationController < ActionController::Base
  helper :all
  # before_filter :blackbird_override
  before_filter :authenticate_user!
  protect_from_forgery 
 
  protected
 
    def blackbird_override
      if 'true' == params[:force_blackbird]
        session[:blackbird] = true
      end
    end
end
