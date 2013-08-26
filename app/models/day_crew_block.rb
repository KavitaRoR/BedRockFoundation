class DayCrewBlock < ActiveRecord::Base
  belongs_to :crew

  attr_accessor :add_to_job

  after_save :persist_to_firebase
  before_destroy :remove_from_firebase

  private
  def persist_to_firebase
    begin
      FirebaseNotes.persist(self)
    rescue
      puts "\n\n*****ERROR saving this dayCrewBlock to Firebase*****\n\n"
    end
  end

  def remove_from_firebase
    begin
      FirebaseNotes.remove(self)
    rescue
      puts "\n\n*****ERROR removing dayCrewBlock to Firebase*****\n\n"
    end
  end

end
