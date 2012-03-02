class Contact < ActiveRecord::Base
  has_many :jobs
  has_many :statuses
  belongs_to :campaign
  belongs_to :contact_status
  has_many :next_actions
  
  before_validation :geocode_address, :on => [:create, :update]


  def name 
    return company if !company.blank?
    return "**NO NAME**" if first_name.blank? && last_name.blank?
    return last_name + ", " + first_name if !first_name.blank? && !last_name.blank?
    return first_name if last_name.blank?
    return last_name if first_name.blank?
    
  end
  
  def address_oneline
    [address_1,address_2,city,province,zip].reject{|f| f.blank? }.join(", ")
  end
  
  def status
    return ContactStatus.find(self.contact_status_id)
  end
  
  private
  def geocode_address
    geo=Geokit::Geocoders::MultiGeocoder.geocode(address_oneline)
    base=Geokit::Geocoders::MultiGeocoder.geocode "461 Old Wilmington Rd, Coatesville, PA"
    errors.add(:address_1, "Could not Geocode address") if !geo.success
    if geo.success
      self.lat, self.lng = geo.lat,geo.lng 
      self.distance=geo.distance_from(base, :units=>:miles)
    end
  end

end
