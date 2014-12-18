require 'gcm'
class NotificationSender
  def initialize(registration_ids, emergency)
    @registration_ids = registration_ids
    @emergency = emergency
    @gcm = GCM.new("AIzaSyAbQbjEui8JIt-IFh0SZyBhtaHLfX6ixKI")
    @registration_ids.each do |r|
      send_message(r.registrationId, @emergency.tipo)
    end
  end
  def send_message(id_android, message)
    registration_ids= [id_android] # an array of one or more client registration IDs
    options = {data: {mensaje: message}}
    response = gcm.send(registration_ids, options)
  end
end