class JobAddition < ActiveRecord::Base
  belongs_to :job
  
  before_destroy :update_job_price
  
  protected
  
  def update_job_price
    self.job.update_attribute(:price_in_cents, (self.job.price_in_cents - self.addition_price_in_cents))
  end
end
