class DayCrewBlock < ActiveRecord::Base
  belongs_to :crew

  attr_accessor :add_to_job

  before_save :persist_to_firebase

  private
  def persist_to_firebase
    begin
      FirebaseNotes.persist(self)
    rescue
      puts "\n\n*****ERROR saving this dayCrewBlock to Firebase*****\n\n"
    end
  end

end
