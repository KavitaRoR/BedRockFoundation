class Campaign < ActiveRecord::Base
  
  def revenue_in_cents
    return cost_in_cents + (10000 * rand(130)) if profitable? && cost_in_cents
    return 0
  end
  
  def profitable?
    @profitable = rand(6) > 2 if @profitable.nil?
    @profitable
  end
end
