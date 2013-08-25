class Crew < ActiveRecord::Base
  has_many :trucks
  has_many :contracts
  has_many :users
  
  before_create :geocode_address
  before_save :geocode_address
  before_save :persist_to_firebase

  
  protected
  
  def geocode_address
    if !self.crew_base_address.blank?
      geo = Geokit::Geocoders::MultiGeocoder.geocode (self.crew_base_address)
      base = Geokit::Geocoders::MultiGeocoder.geocode "461 Old Wilmington Rd, Coatesville, PA"

      if geo.success
        self.lat, self.lng = geo.lat,geo.lng 
      end
    end
  end
  
  def persist_to_firebase
    begin
      FirebaseCrews.persist(self)
    rescue
      puts "\n\n*****ERROR saving this crew to Firebase*****\n\n"
    end
  end

end
