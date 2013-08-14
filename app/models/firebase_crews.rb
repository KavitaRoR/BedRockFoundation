class FirebaseCrews
  # @@base_uri = 'https://bedrock.firebaseio.com/'

  def self.persist(crew)
    Firebase.base_uri = 'https://bedrock.firebaseio.com/'
    valid = false

    data = OpenStruct.new

    data.name = crew.crew_name
    data.id = crew.id
    data.order = crew.ordering

    data = data.marshal_dump
    response = Firebase.set("crews/ID-#{crew.id}", data)
    response.success?
  end 
end