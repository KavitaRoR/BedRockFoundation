class Estimate < ActiveRecord::Base
  belongs_to :job
  
  def push_to_sold
    begin
      c = Contract.new
      c.estimate_id = self.id
      c.save 
    
      self.update_attribute(:sold, true)

      return true
    rescue Exception => e
      logger.debug("Problem in Push to Sold: #{e.message}")
      return false
    end
  end
end
