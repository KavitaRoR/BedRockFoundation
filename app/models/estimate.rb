class Estimate < ActiveRecord::Base
  belongs_to :job
  has_one :contract
  belongs_to :job_type
  
  has_many :wepay_checkout_records, :foreign_key => :reference_id
  has_many :square_payments
  has_many :check_payments
  
  before_create :generate_invoice_number, :generate_token
  after_create :remove_off_level_to_show

  
  def name
    job.name
  end

  def location
    job.city_state
  end

  def push_to_sold(creator)
    begin
      c = Contract.new
      c.estimate_id = self.id
      c.save
      # puts "hi" 
      self.job.statuses.last.update_attribute("done", true)
      self.job.statuses.create({:notes => "Sold!", :assigned_by => creator.id, :assigned_to => creator.id, :done => true, :next_action_id => 7})
      # puts "bye"
      self.update_attribute(:sold, true)

      return true
    rescue Exception => e
      logger.debug("Problem in Push to Sold: #{e.message}")
      return false
    end
  end

  def loadflashvars
    logger.info flashvars
    myvars = YAML::load(flashvars).with_indifferent_access
    logger.info "@@@ #{myvars[:job_type]}"
    myvars
  end

  def update_addresses_if_necessary!
    if self.job.contact.updated_at > self.updated_at
      if self.contract && self.contract.scheduled_date < (Date.today + 1.day)
        #do nothing
        logger.info "***** THIS DID NOT UPDATE"
        logger.info self.id
        logger.info self.contract.scheduled_date rescue " No Contract"
      else
        logger.info "***** THIS IS UPDATING"
        logger.info self.id
        logger.info loadflashvars[:job_type]
        logger.info self.contract.scheduled_date rescue " No Contract"

        update_address_do_it!
        logger.info flashvars
      end
    end
  end

  def update_address_do_it!
    self.flashvars = self.job.options_for_print(loadflashvars[:job_type]).with_indifferent_access
    self.save
  end

    def remove_off_level_to_show
      if self.job.off_level_amount_in_inches
        self.update_attribute "off_level_to_show", ""
        self.show_payment_buttons = true
      end
    end

  def save_payment( params )
    if params[:payment_type] == "SquarePayment"
      self.square_payments.create!( 
        receipt_number: params[:receipt_number], total: params[:total] )
    else
      self.check_payments.create!(
        check_number: params[:check_number], total: params[:total] )
    end  
  end

  def generate_token
    self.token = loop do
      random_token = self.class.random_token
      break random_token unless self.class.where(token: random_token).exists?
    end
  end

  def self.random_token
    chars = "23456789abcdefghjkmnprstuvwxyz"
    9.times.map{chars[rand(chars.length-1)]}.join
  end

  protected
  def generate_invoice_number
    str = Estimate.find(:all, :order => "invoice_number DESC").first.invoice_number
    str = str.to_i + 1
    self.invoice_number = str
    
  end
end
