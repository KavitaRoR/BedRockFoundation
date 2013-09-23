class Location < ActiveRecord::Base
  
  before_create :geocode_address
  before_save :geocode_address

  def self.show_on_map
    where(:on_map => true).where("lat is not NULL").where("lng is not NULL")
  end

  def address_oneline
    [address_1,city,province,zip].reject{|f| f.blank? }.join(", ")
  end
  
  
  protected
   def geocode_address
     if self.valid? && address_1 != "" && !address_1.nil?
       geo = Geokit::Geocoders::MultiGeocoder.geocode(self.address_oneline)

       if geo.success
         self.lat = geo.lat
         self.lng = geo.lng
       else
         errors.add(:address_1, "Could not Geocode address")
       end
     end
   end
   
end
