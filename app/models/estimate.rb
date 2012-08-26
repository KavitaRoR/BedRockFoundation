class Estimate < ActiveRecord::Base
  belongs_to :job
  has_one :contract
  belongs_to :job_type
  
  before_create :generate_invoice_number
  
  def name
    job.name
  end

  def location
    job.city_state
  end

  def push_to_sold(creator)
    begin
      c = Contract.new
      c.estimate_id = self.id
      c.save
      puts "hi" 
      self.job.statuses.last.update_attribute("done", true)
      self.job.statuses.create({:notes => "Sold!", :assigned_by => creator.id, :assigned_to => creator.id, :done => true, :next_action_id => 7})
      puts "bye"
      self.update_attribute(:sold, true)

      return true
    rescue Exception => e
      logger.debug("Problem in Push to Sold: #{e.message}")
      return false
    end
  end
  
  protected
  def generate_invoice_number
    str = Estimate.find(:all, :order => "invoice_number DESC").first.invoice_number
    str = str.to_i + 1
    self.invoice_number = str
    
  end
end
