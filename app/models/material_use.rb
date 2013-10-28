class MaterialUse < ActiveRecord::Base
  belongs_to :material
  belongs_to :job
  belongs_to :job_addition

  before_save :update_job_addition
  before_destroy :delete_job_addition

  def estimated_price
    if material.apply_markup
      qty_estimated * material.price_per_unit * job.material_markup rescue 0
    else
      qty_estimated * material.price_per_unit rescue 0
    end
  end

  def description
    "QTY: #{qty_estimated} #{material.quantity_label} of #{material.list_label_no_price}"
  end

  def update_job_addition
    puts "JOB ADDITION: #{job_addition.inspect}"
    job_addition ||= JobAddition.new(:job_id => job_id)
    job_addition.addition_price_in_dollars = estimated_price
    job_addition.addition_description = description
    job_addition.save
    self.job_addition_id = job_addition.id
  end

  def delete_job_addition
    job_addition.destroy
  end
end
