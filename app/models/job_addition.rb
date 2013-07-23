class JobAddition < ActiveRecord::Base
  belongs_to :job
  # has_one :material_use
  
  before_destroy :update_job_price

  attr_accessible :addition_price_in_dollars, :addition_price_in_cents, :addition_description, :job_id

  def addition_price_in_dollars=(price)
    self.addition_price_in_cents = (price.to_f * 100).to_i
  end

  def addition_price_in_dollars
    self.addition_price_in_cents.to_f / 100
  end 

  def is_a_material_addition?
    false #material_use.present?
  end
  
  protected
  
  def update_job_price
    if self.job
      self.job.update_attribute(:price_in_cents, (self.job.price_in_cents - self.addition_price_in_cents))
    end
  end
end
