class Contact < ActiveRecord::Base
  has_many :jobs
  has_many :statuses
  belongs_to :campaign
  belongs_to :contact_status
  has_many :next_actions
  belongs_to :shed_company
  
  before_create :geocode_address
  after_create :create_initial_todo
  before_save :geocode_address
  after_save :update_estimates_in_the_hopper

  scope :last_name, order( :last_name )

  def name 
    return company if !company.blank?
    return "**NO NAME**" if first_name.blank? && last_name.blank?
    return last_name + ", " + first_name if !first_name.blank? && !last_name.blank?
    return first_name if last_name.blank?
    return last_name if first_name.blank?
  end
  
  def big_potential_deal?
    jobs.any?{|j| j.price_in_cents > 499999}
  end
  
  def has_sold_contract?
    jobs.any?{|j| j.contract? }
  end
  
  
  def address_oneline
    [address_1,address_2,city,province,zip].reject{|f| f.blank? }.join(", ")
  end
  
  def status
    return ContactStatus.find(self.contact_status_id)
  end
  
  protected
  def geocode_address
    if self.valid? && address_1 != "" && !address_1.nil?
      geo = Geokit::Geocoders::MultiGeocoder.geocode(self.address_oneline)
      base = Geokit::Geocoders::MultiGeocoder.geocode "461 Old Wilmington Rd, Coatesville, PA"

      if geo.success
        self.lat = geo.lat
        self.lng = geo.lng
        self.distance = geo.distance_from(base, :units => :miles)
      else
        errors.add(:address_1, "Could not Geocode address")
      end
    end
  end

  def update_estimates_in_the_hopper
    for job in self.jobs
      for est in job.estimates
        est.update_addresses_if_necessary!
      end
    end
  end
  
  def create_initial_todo
    Status.create(:contact_id => self.id, :revenue_potential => "???",
		:revenue_result => "???", :percentage_probability => 27,
		:projected_sale_amount => "???", :expected_close_date => Time.now, :current_situation => "", :row_highlight_color => "", :notes => "Created account in the system. Please follow up", :followup_date => Time.now, :next_action_id => 1, :assigned_by => self.created_by, :assigned_to => 2)
  end

end
