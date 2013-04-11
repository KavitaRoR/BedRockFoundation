class Campaign < ActiveRecord::Base
  has_many :contacts

  def revenue_in_cents
    return cost_in_cents + (10000 * rand(130)) if profitable? && cost_in_cents
    return 0
  end
  
  def profitable?
    @profitable = rand(6) > 2 if @profitable.nil?
    @profitable
  end

  def self.search( params )
  	Campaign.joins( { contacts: { jobs: [estimates: :contract] } })
    .select( "campaigns.*, concat( contacts.first_name, ' ', contacts.last_name ) AS contact_name,jobs.*, estimates.*,contracts.updated_at AS contract_date" )
    .where( "campaigns.id = ? AND DATE_FORMAT(contracts.updated_at, '%Y-%m-%e') BETWEEN ? AND ?", params[:campaign], params[:from], params[:to] )
  end
  
end
