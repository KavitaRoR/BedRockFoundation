class ApplicationController < ActionController::Base
  helper :all
  # before_filter :blackbird_override
  protect_from_forgery 
 
  protected
 
    def blackbird_override
      if 'true' == params[:force_blackbird]
        session[:blackbird] = true
      end
    end
end
