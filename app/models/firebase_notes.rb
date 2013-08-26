class FirebaseNotes
  def self.persist(note)
    Firebase.base_uri = 'https://bedrock.firebaseio.com/'
    valid = false

    data = OpenStruct.new

    data.reason = note.reason
    data.crew_id = note.crew_id
    data.day = note.day.strftime("%Y-%m-%d")
    data.id = note.id
    data.block_off = note.block_off
    data.working_with_crew_id = note.working_with_crew_id
    data.contract_id = note.contract_id

    data = data.marshal_dump
    response = Firebase.set("notes/ID-#{note.id}", data)
    response.success?
  end 
  def self.remove(note)
    response = Firebase.delete("notes/ID-#{note.id}")
    response.success?
  end
end