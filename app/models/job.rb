# encoding: utf-8
require "rock_pad_calculator"
class Job < ActiveRecord::Base
  # acts_as_gmappable
  
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
    return "#{contact.name} - ##{self.estimates.select{|e| e.sold?}.first.invoice_number }" if !self.estimates.select{|e| e.sold? }.empty?
    return "#{contact.name} - ##{id}"
    return "#{id}"
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
    return "#{self.estimate_or_contract} - #{self.width} × #{self.length} - #{self.job_type.kind}"
  end
  
  def address_oneline
    [address_1,address_2,city,province,zip].reject{|f| f.blank? }.join(", ")
  end

  def city_state
    [city,province].reject{|f| f.blank? }.join(", ")
  end
  
  def latitude
    self.lat
  end
  
  def longitude
    self.lng
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
    econ_12 = RockPadCalculator.new(self.distance, self.width, self.length,"Economy", self.border_sixbysix, 1).total_price + (self.additional_price * 100) - (self.discount * 100)
    econ_18 = RockPadCalculator.new(self.distance, self.width, self.length,"Economy", self.border_sixbysix, 1.5).total_price + (self.additional_price * 100) - (self.discount * 100)
    econ_24 = RockPadCalculator.new(self.distance, self.width, self.length,"Economy", self.border_sixbysix, 2).total_price + (self.additional_price * 100) - (self.discount * 100)
    econ_30 = RockPadCalculator.new(self.distance, self.width, self.length,"Economy", self.border_sixbysix, 2.5).total_price + (self.additional_price * 100) - (self.discount * 100)
    econ_36 = RockPadCalculator.new(self.distance, self.width, self.length,"Economy", self.border_sixbysix, 3).total_price + (self.additional_price * 100) - (self.discount * 100)
    stan_0 = RockPadCalculator.new(self.distance, self.width, self.length,"Standard", self.border_sixbysix, 0).total_price + (self.additional_price * 100) - (self.discount * 100)
    stan_12 = RockPadCalculator.new(self.distance, self.width, self.length,"Standard", self.border_sixbysix, 1).total_price + (self.additional_price * 100) - (self.discount * 100)
    stan_18 = RockPadCalculator.new(self.distance, self.width, self.length,"Standard", self.border_sixbysix, 1.5).total_price + (self.additional_price * 100) - (self.discount * 100)
    stan_24 = RockPadCalculator.new(self.distance, self.width, self.length,"Standard", self.border_sixbysix, 2).total_price + (self.additional_price * 100) - (self.discount * 100)
    stan_30 = RockPadCalculator.new(self.distance, self.width, self.length,"Standard", self.border_sixbysix, 2.5).total_price + (self.additional_price * 100) - (self.discount * 100)
    stan_36 = RockPadCalculator.new(self.distance, self.width, self.length,"Standard", self.border_sixbysix, 3).total_price + (self.additional_price * 100) - (self.discount * 100)
    elite_0 = RockPadCalculator.new(self.distance, self.width, self.length,"Elite", self.border_sixbysix, 0).total_price + (self.additional_price * 100) - (self.discount * 100)
    elite_12 = RockPadCalculator.new(self.distance, self.width, self.length,"Elite", self.border_sixbysix, 1).total_price + (self.additional_price * 100) - (self.discount * 100)
    elite_18 = RockPadCalculator.new(self.distance, self.width, self.length,"Elite", self.border_sixbysix, 1.5).total_price + (self.additional_price * 100) - (self.discount * 100)
    elite_24 = RockPadCalculator.new(self.distance, self.width, self.length,"Elite", self.border_sixbysix, 2).total_price + (self.additional_price * 100) - (self.discount * 100)
    elite_30 = RockPadCalculator.new(self.distance, self.width, self.length,"Elite", self.border_sixbysix, 2.5).total_price + (self.additional_price * 100) - (self.discount * 100)
    elite_36 = RockPadCalculator.new(self.distance, self.width, self.length,"Elite", self.border_sixbysix, 3).total_price + (self.additional_price * 100) - (self.discount * 100)
    
    return {
      economy: {zero: econ_0, twelve: econ_12, eighteen: econ_18, twentyfour: econ_24, thirty: econ_30, thirtysix: econ_36},
      standard: {zero: stan_0, twelve: stan_12, eighteen: stan_18, twentyfour: stan_24, thirty: stan_30, thirtysix: stan_36},
      elite: {zero: elite_0, twelve: elite_12, eighteen: elite_18, twentyfour: elite_24, thirty: elite_30, thirtysix: elite_36}
    }
  end
  
  def specific_offlevel(kind)
    kind_0 = RockPadCalculator.new(self.distance, self.width, self.length, kind.capitalize, self.border_sixbysix, 0).total_price + (self.additional_price * 100) - (self.discount * 100)
    kind_12 = RockPadCalculator.new(self.distance, self.width, self.length, kind.capitalize, self.border_sixbysix, 1).total_price + (self.additional_price * 100) - (self.discount * 100)
    kind_18 = RockPadCalculator.new(self.distance, self.width, self.length, kind.capitalize, self.border_sixbysix, 1.5).total_price + (self.additional_price * 100) - (self.discount * 100)
    kind_24 = RockPadCalculator.new(self.distance, self.width, self.length, kind.capitalize, self.border_sixbysix, 2).total_price + (self.additional_price * 100) - (self.discount * 100)
    kind_30 = RockPadCalculator.new(self.distance, self.width, self.length, kind.capitalize, self.border_sixbysix, 2.5).total_price + (self.additional_price * 100) - (self.discount * 100)
    kind_36 = RockPadCalculator.new(self.distance, self.width, self.length, kind.capitalize, self.border_sixbysix, 3).total_price + (self.additional_price * 100) - (self.discount * 100)
    return {
      zero: [kind_0, 0], twelve: [kind_12, 12], eighteen: [kind_18, 18], twentyfour: [kind_24, 24], thirty: [kind_30, 30], thirtysix: [kind_36, 36]
    }
  end
  
  def money_from_cents(cents)
    return "$0" if cents == 0 || cents.nil?
    number_to_currency (cents.to_f / 100)
  end
  
  def job_description_for_flash(kind)
    str = ""
    if kind == "Economy"
      str = "This foundation eliminates the 4\"× 6\" pressure-treated border, the weed fabric and the rebar. It will be filled in with 5-6 inches of #5 clean stone which helps for quick drainage and insures that your structure remains level on top of the stone base."
    elsif kind == "Standard"
      str = "Excavation of area ensures that the top of the foundation will be even with the ground where the entrance of the structure will be located. 4\"× 6\" pressure treated timbers are used for the border. ½\"× 2' rebar secures the border to the ground. Geotextile fabric is used to eliminate weed growth around the structure. The soil will be compacted to eliminate settling. This area will be filled in with 5-6 inches of #5 clean stone which helps for quick drainage and insures that your structure remains level on top of the stone base."
    elsif kind == "Elite"
      str = "Excavation of area ensures that the top of the foundation will be even with the ground where the entrance of the structure will be located. 4\"× 6\" pressure treated timbers are used for the border with 1\"× 6\" Trex-composite capping on top of the border to enhance the beauty and extend the durability of the border.  ½\"× 2' rebar secures the border to the ground. Geotextile fabric is used to eliminate weed growth around the structure. The soil will be compacted to eliminate settling. This area will be filled in with 5-6 inches of #5 clean stone which helps for quick drainage and insures that your structure remains level on top of the stone base."
    elsif kind == "Custom"
      str = "This foundation eliminates the 4\"× 6\" pressure-treated border, the weed fabric and the rebar. The soil will be compacted to eliminate settling. It will be filled in with 5-6 inches of #5 clean stone which helps for quick drainage and insures that your structure remains level on top of the stone base."
    end
    
    str.gsub("4\"× 6\" pressure", "6\"× 6\" pressure") if self.border_sixbysix
  end
  
  def options_for_print(kind="Standard")
    pad_job = RockPadCalculator.new(self.distance, self.width, self.length, kind, self.border_sixbysix, ((self.off_level_amount_in_inches / 12) rescue 0))
    logger.debug("Pad Job: #{pad_job.total_price}")
    if self.contact
      return { 
    		contact_name: "#{ self.contact.first_name rescue ""} #{ self.contact.last_name rescue "" }",
    		contact_address: "#{ self.contact.address_1 rescue "" }",
    		contact_address2: "#{ self.contact.city rescue "" }, #{ self.contact.province rescue ""}   #{self.contact.zip rescue ""}",
    		contact_phone_home: "#{ self.contact.phone rescue "" }",
    		contact_phone_cell: "#{ self.contact.phone_alt rescue "" }",
    		contact_phone_work: "#{ self.contact.phone_work rescue "" }",
    		contact_email: "#{ self.contact.email rescue "" }",
    		shed_company: "#{ self.contact.campaign.name rescue "None" }",
    		job_location_abbr: "#{ self.location.abbreviation rescue 'ERR' }",
    		job_location_phone: "#{ self.location.phone rescue '- no location assigned' }",
    		job_quality: "#{ kind rescue "" }",
    		job_quality_alt: "#{ self.description rescue "" }",
    		job_description: "#{ job_description_for_flash(kind) }",
    		job_extras: "#{ self.extras.join('\n') rescue "" }",
    		job_price: "#{money_from_cents pad_job.total_price + (self.additional_price * 100) - (self.discount * 100)}",
    		additional_price: "#{money_from_cents(self.additional_price * 100)}",
    		job_total_price: "#{money_from_cents(pad_job.total_price + (self.additional_price * 100) - (self.discount * 100))}",
    		job_width: "#{self.width}",
    		job_length: "#{self.length}",
    		job_inches: "#{self.off_level_amount_in_inches}",
    		job_kind: "#{kind}",
    		foundation_kind: "#{self.foundation.kind rescue ''} Foundation",
    		job_date: "#{ self.updated_at.strftime('%m/%d/%Y') || '' }",
    		estimate_date: "#{ self.updated_at.strftime('%m/%d/%Y') || ""}"
    	}
    else
      return {}
    end
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
