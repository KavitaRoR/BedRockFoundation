class MaterialUse < ActiveRecord::Base
  belongs_to :material
  belongs_to :job
  belongs_to :job_addition

  before_create :make_job_addition
  after_save :update_job_addition

  def estimate_price
    qty_estimated * material.price_per_unit * job.material_markup
  end

  def make_job_addition
    job_addition = JobAddition.create()
  end

  def update_job_addition

  end
end
