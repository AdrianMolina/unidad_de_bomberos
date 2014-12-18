require 'gcm'

gcm = GCM.new("AIzaSyAbQbjEui8JIt-IFh0SZyBhtaHLfX6ixKI")

registration_ids= ["APA91bEyj_lUsAM3q9olAqLGZJTnVTBpTGXikuXnkuNTdxueKOl4IhJOJeedS6mBNkYoRZCLDmOfoflh8toVNH3pGVsEVYQ8xRmMtxve2jvnvalvug-x9RrxVkKZvWaCAuZRoQ0Jd7apfgX3d6XWHxVsz_Bu5biP0Q", "20080411"] # an array of one or more client registration IDs
options = {data: {mensaje: "cochino poncho"}}

response = gcm.send(registration_ids, options)


