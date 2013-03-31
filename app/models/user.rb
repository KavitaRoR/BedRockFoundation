class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :crew_id, :permissions_levels
  belongs_to :crew

  def is_admin?
  	self.permissions_levels == "Admin"
  end

  def is_foreman?
  	self.permissions_levels == "Crew Foreman"
  end
end
