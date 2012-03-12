# encoding: utf-8
require "rock_pad_calculator"
class Job < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  belongs_to :job_type
  belongs_to :truck
  belongs_to :contact
  belongs_to :foundation
  belongs_to :pad_size
  belongs_to :location
  has_many :statuses, :dependent => :destroy
  has_many :estimates
  
  
  after_create :create_initial_status
  before_create :geocode_address
  before_save :geocode_address
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
    @padjob ||= RockPadCalculator.new(self.distance, self.width, self.length, (self.job_type.kind rescue "Standard"), self.border_sixbysix, (self.off_level_amount_in_inches.to_f/12))
  end
  
  def pad_job_with_options
    @padjob ||= RockPadCalculator.new(self.distance, self.width, self.length, (self.job_type.kind rescue "Standard"), self.border_sixbysix, (self.off_level_amount_in_inches.to_f/12))
  end
  
  def pad_job_type_offset
    econ_0 = RockPadCalculator.new(self.distance, self.width, self.length,"Economy", self.border_sixbysix, 0).total_price + (self.additional_price * 100) - (self.discount * 100)
    econ_6 = RockPadCalculator.new(self.distance, self.width, self.length,"Economy", self.border_sixbysix, 0.5).total_price + (self.additional_price * 100) - (self.discount * 100)
    econ_12 = RockPadCalculator.new(self.distance, self.width, self.length,"Economy", self.border_sixbysix, 1).total_price + (self.additional_price * 100) - (self.discount * 100)
    econ_18 = RockPadCalculator.new(self.distance, self.width, self.length,"Economy", self.border_sixbysix, 1.5).total_price + (self.additional_price * 100) - (self.discount * 100)
    econ_24 = RockPadCalculator.new(self.distance, self.width, self.length,"Economy", self.border_sixbysix, 2).total_price + (self.additional_price * 100) - (self.discount * 100)
    stan_0 = RockPadCalculator.new(self.distance, self.width, self.length,"Standard", self.border_sixbysix, 0).total_price + (self.additional_price * 100) - (self.discount * 100)
    stan_6 = RockPadCalculator.new(self.distance, self.width, self.length,"Standard", self.border_sixbysix, 0.5).total_price + (self.additional_price * 100) - (self.discount * 100)
    stan_12 = RockPadCalculator.new(self.distance, self.width, self.length,"Standard", self.border_sixbysix, 1).total_price + (self.additional_price * 100) - (self.discount * 100)
    stan_18 = RockPadCalculator.new(self.distance, self.width, self.length,"Standard", self.border_sixbysix, 1.5).total_price + (self.additional_price * 100) - (self.discount * 100)
    stan_24 = RockPadCalculator.new(self.distance, self.width, self.length,"Standard", self.border_sixbysix, 2).total_price + (self.additional_price * 100) - (self.discount * 100)
    elite_0 = RockPadCalculator.new(self.distance, self.width, self.length,"Elite", self.border_sixbysix, 0).total_price + (self.additional_price * 100) - (self.discount * 100)
    elite_6 = RockPadCalculator.new(self.distance, self.width, self.length,"Elite", self.border_sixbysix, 0.5).total_price + (self.additional_price * 100) - (self.discount * 100)
    elite_12 = RockPadCalculator.new(self.distance, self.width, self.length,"Elite", self.border_sixbysix, 1).total_price + (self.additional_price * 100) - (self.discount * 100)
    elite_18 = RockPadCalculator.new(self.distance, self.width, self.length,"Elite", self.border_sixbysix, 1.5).total_price + (self.additional_price * 100) - (self.discount * 100)
    elite_24 = RockPadCalculator.new(self.distance, self.width, self.length,"Elite", self.border_sixbysix, 2).total_price + (self.additional_price * 100) - (self.discount * 100)
    
    return {
      economy: {zero: econ_0, six: econ_6, twelve: econ_12, eighteen: econ_18, twentyfour: econ_24},
      standard: {zero: stan_0, six: stan_6, twelve: stan_12, eighteen: stan_18, twentyfour: stan_24},
      elite: {zero: elite_0, six: elite_6, twelve: elite_12, eighteen: elite_18, twentyfour: elite_24}
    }
  end
  
  def money_from_cents(cents)
    return "$0" if cents == 0 || cents.nil?
    number_to_currency (cents.to_f / 100)
  end
  
  def options_for_print(kind="Standard")
    pad_job = RockPadCalculator.new(self.distance, self.width, self.length, kind, self.border_sixbysix, 2)
    return { 
  		contact_name: "#{ self.contact.first_name } #{ self.contact.last_name }",
  		contact_address: "#{ self.contact.address_1 }",
  		contact_address2: "#{ self.contact.city }, #{ self.contact.province}   #{self.contact.zip}",
  		contact_phone_home: "#{ self.contact.phone }",
  		contact_phone_cell: "#{ self.contact.phone_alt }",
  		contact_phone_work: "#{ self.contact.phone_work }",
  		contact_email: "#{ self.contact.email }",
  		job_location_abbr: "#{ self.location.abbreviation rescue 'ERR' }",
  		job_location_phone: "#{ self.location.phone rescue '- no location assigned' }",
  		job_quality: "#{ kind }",
  		job_quality_alt: "#{ self.description }",
  		job_extras: "#{ self.extras.join('\n') }",
  		job_price: "#{money_from_cents pad_job.total_price + (self.additional_price * 100) - (self.discount * 100)}",
  		additional_price: "#{money_from_cents(self.additional_price * 100)}",
  		job_total_price: "#{money_from_cents(pad_job.total_price + (self.additional_price * 100) - (self.discount * 100))}",
  		job_width: "#{self.width}",
  		job_length: "#{self.length}",
  		job_inches: "#{self.off_level_amount_in_inches}",
  		job_kind: "#{kind}",
  		foundation_kind: "#{self.foundation.kind rescue ''} Foundation",
  		job_date: "#{ self.updated_at.strftime('%m/%d/%Y') || '' }"
  	}
  end
  
  protected
  
    def create_initial_status
      statuses.create({:notes => "Created new Estimate", :assigned_by => @creator.id, :assigned_to => @creator.id, :done => true})
    end
    def geocode_address
      if !self.address_1.blank?
        geo = Geokit::Geocoders::MultiGeocoder.geocode (address_oneline)
        base = Geokit::Geocoders::MultiGeocoder.geocode "461 Old Wilmington Rd, Coatesville, PA"
        errors.add(:address_1, "Could not Geocode address") if !geo.success
        if geo.success
          self.lat, self.lng = geo.lat,geo.lng 
          self.distance = geo.distance_from(base, :units=>:miles)
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
