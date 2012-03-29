class PassthroughController < ApplicationController
  def index
    if current_user
      path = "/schedule/consolidated_printable" if current_user.permissions_levels.to_s.include?("Crew Foreman")
      path = "/dashboard" if current_user.permissions_levels.to_s.include?("Admin")
    else 
      path = "/users/sign_in"
    end
    
    redirect_to path
  end
end