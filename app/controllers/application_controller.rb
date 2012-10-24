class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  
  layout Proc.new { |controller| current_user && current_user.permissions_levels.to_s.include?("Admin") ? "application" : 'foreman' }
  
  helper :all
  # before_filter :blackbird_override
  protect_from_forgery 
  
  def has_session_return_to?
    if session[:return_to].nil? or session[:return_to].blank?
      return false
    else 
      url = session[:return_to]
      session[:return_to] = nil
      redirect_to url
      return true
    end
  end
 
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
