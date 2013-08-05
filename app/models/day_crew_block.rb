class DayCrewBlock < ActiveRecord::Base
  belongs_to :crew

  attr_accessor :add_to_job
end
