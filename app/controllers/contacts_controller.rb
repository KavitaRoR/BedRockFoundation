class ContactsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @page_title = "All Contacts"
    @contacts = Contact.find(:all)
    session[:look] = 'index'
  end
  
  def show
    @contact = Contact.find(params[:id])
    session[:look] = 'show'
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      flash[:notice] = "Successfully created contact."
      redirect_to contacts_url and return if params[:commit] == "Save"
      redirect_to new_contact_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @contact = Contact.find(params[:id])
  end
  
  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      flash[:notice] = "Successfully updated contact."
      redirect_to @contact if session[:look] == 'show'
      redirect_to contacts_url if session[:look] == 'index'
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = "Successfully destroyed contact."
    redirect_to contacts_url
  end
  
  def active_contacts
    @page_title = "Active Contacts"
    cs_arr = []
    ContactStatus.all.each do |cs|
      if cs.status_name.downcase != 'dead'
        cs_arr.push(cs.id)
      end
    end
    @contacts = Contact.find(:all, :conditions => ["contact_status_id IN (?)", cs_arr ])
    render :template => 'contacts/index'
  end
  
  def dead_contacts
    @page_title = "Dead Contacts"
    @contacts = Contact.find(:all, :conditions => {:contact_status_id => ContactStatus.find_by_status_name("Dead").id })
    render :template => 'contacts/index'
  end
  
  def contact_active
    @contact = Contact.find(params[:id])
    @contact.contact_status_id = ContactStatus.find_by_status_name("Active").id
    if @contact.save
      logger.debug("mission accomplished")
      flash[:notice] = "Contact is now Active"
    else 
      logger.debug("mission failed.")
      flash[:notice] = "Contact was not successfully updated."
    end
    redirect_to :back
  end
  
  def contact_dead
    @contact = Contact.find(params[:id])
    @contact.contact_status_id = ContactStatus.find_by_status_name("Dead").id
    if @contact.save
      logger.debug("swimmin with the fishies")
      flash[:notice] = "Contact is now Dead"
    else 
      logger.debug("safe... for now")
      flash[:notice] = "Contact was not successfully updated."
    end
    redirect_to :back
  end
end
