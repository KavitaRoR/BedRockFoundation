# encoding: utf-8
require "rock_pad_calculator"
class Job < ActiveRecord::Base
  belongs_to :truck
  belongs_to :contact
  has_many :statuses, :dependent => :destroy
  belongs_to :foundation
  belongs_to :pad_size
  belongs_to :location
  
  before_validation :geocode_address, :on => [:create, :update]
  
  after_create :create_initial_status
  
  before_save :calculate_pad_costs
  
  scope :by_recent, :order => "updated_at DESC"
  
  def name
    return id if contact.nil?
    return "#{contact.name} - #{pad_size.size rescue 'unknown' } ##{id}"
  end
  
  def estimate_or_contract
    estimate? ? "Est" : "Cont"
  end
  
  def creator=(user)
    @creator = user
  end
  
  def estimate?
    current_scheduled_at.nil?
  end

  def contract?
    !current_scheduled_at.nil? && current_scheduled_at > Time.now
  end

  def completed?
    !current_scheduled_at.nil? && current_scheduled_at < Time.now
  end
  
  def referencing
    return "#{self.estimate_or_contract} - #{self.width} × #{self.length} - #{self.economy_or_elite}"
  end
  
  def address_oneline
    [address_1,address_2,city,province,zip].reject{|f| f.blank? }.join(", ")
  end
  
  def extras
    str = []
    str << "Accessible with machine: #{accessible_with_machine}" if !accessible_with_machine.blank? 
    str << "Additional fill dirt needed: #{additional_fill_dirt}" if !additional_fill_dirt.blank? 
    str << "Build up timbers: #{build_up_timbers}" if !build_up_timbers.blank? 
    str << "Timber wall: #{timber_wall}" if !timber_wall.blank? 
    str
  end
  
  def pad_job
    @padjob ||= RockPadCalculator.new(self.distance, self.width, self.length, self.economy_or_elite, self.border_sixbysix, (self.off_level_amount_in_inches.to_f/12))
  end
  
  protected
  
    def create_initial_status
      statuses.create({:notes => "Created new Estimate", :assigned_by => @creator.id, :assigned_to => @creator.id, :done => true})
    end
    def geocode_address
      if !self.address_1.blank?
        geo=Geokit::Geocoders::MultiGeocoder.geocode (address_oneline)
        base=Geokit::Geocoders::MultiGeocoder.geocode "461 Old Wilmington Rd, Coatesville, PA"
        errors.add(:address_1, "Could not Geocode address") if !geo.success
        if geo.success
          self.lat, self.lng = geo.lat,geo.lng 
          self.distance=geo.distance_from(base, :units=>:miles)
        end
      else
        # reuse the contact's current geodata
        cont = Contact.find(self.contact_id)
        self.lat, self.lng, self.distance = cont.lat, cont.lng, cont.distance
        self.address_1, self.address_2, self.city, self.province, self.zip = cont.address_1, cont.address_2, cont.city, cont.province, cont.zip
      end
    end
    def calculate_pad_costs
      self.discount = 0.00 if self.discount == nil
      self.price_in_cents = pad_job.total_price + (self.additional_price * 100) - (self.discount * 100)
      self.labor_cost_in_cents = pad_job.total_labor_cost
      logger.debug("Pad job: " + pad_job.inspect)
      self.material_cost_in_cents = pad_job.total_material_cost
    end
end
