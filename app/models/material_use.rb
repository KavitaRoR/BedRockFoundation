class MaterialUse < ActiveRecord::Base
  belongs_to :material
  belongs_to :job
  belongs_to :job_addition

  before_save :update_job_addition
  before_destroy :delete_job_addition

  def estimated_price
    qty_estimated * material.price_per_unit * job.material_markup rescue "0"
  end

  def description
    "QTY: #{qty_estimated} of #{material.name} - #{material.dimensions}"
  end

  def update_job_addition
    job_addition = JobAddition.new(:job_id => job_id) if job_addition.nil?
    job_addition.addition_price_in_dollars = estimated_price
    job_addition.addition_description = description
    job_addition.save
    self.job_addition_id = job_addition.id
  end

  def delete_job_addition
    job_addition.destroy
  end
end
