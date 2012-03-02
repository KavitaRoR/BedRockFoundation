class Foundation < ActiveRecord::Base
  
  scope :ordered, :order => "position"

end
