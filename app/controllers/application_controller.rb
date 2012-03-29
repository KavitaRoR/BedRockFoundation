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
    
  def require_admin
    return true if current_user && current_user.permissions_levels.to_s.include?("Admin")
  end
  
  def require_foreman
    return true if current_user && current_user.permissions_levels.to_s.include?(["Admin", "Crew Foreman"])
  end
end
