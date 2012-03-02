class PadSize < ActiveRecord::Base
  has_many :jobs
  
  def size
    "#{width} x #{length}"
  end
end
