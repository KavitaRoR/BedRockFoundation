class Quarry < ActiveRecord::Base
	belongs_to :location
	after_create :geocode_address

  def geocode_address
    geo = Geokit::Geocoders::MultiGeocoder.geocode(address_oneline)
    errors.add(:address_1, "Could not Geocode address") if !geo.success
    raise "Geocode Error" if !geo.success
    if geo.success
      self.lat, self.lng = geo.lat,geo.lng 
      self.save
    end
  end

  def address_oneline
    [address_1,city,state,zip].reject{|f| f.blank? }.join(", ")
  end

  def address_block
    return "#{self.address_1 rescue ""}<br />#{self.address_2.nil? || self.address_2.empty? ? "" : "#{self.address_2 rescue ""}<br />" } #{self.city rescue ""}, #{self.state rescue ""} #{self.zip rescue ""}"
  end
end
