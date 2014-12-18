require 'gcm'
class NotificationSender
  def initialize(registration_ids, emergency)
    @registration_ids = registration_ids
    @emergency = emergency
    @gcm = GCM.new("AIzaSyAbQbjEui8JIt-IFh0SZyBhtaHLfX6ixKI")
    @registration_ids.each do |r|
      send_message(r.registrationId, @emergency)
    end
  end
  def send_message(id_android, emergency)
    registration_ids= [id_android] # an array of one or more client registration IDs
    options = {data: {mensaje: "Emergencia en progreso de tipo: "+emergency.tipo+", en la calle "+emergency.lugar}}
    response = @gcm.send(registration_ids, options)
  end
end