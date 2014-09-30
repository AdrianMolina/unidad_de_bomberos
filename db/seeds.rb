# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(nombre: 'ben', apellido: 'affleck', rango:'teniente', email:'batman@dc.com', password:'12345678', password_confirmation:'12345678', estado:'activo', ap_materno:'no', escalafon:'123456', especialidad:'franco', telefono:'12345678', celular:'452135', fecha_nacimiento:'30/09/2014', egreso:'2013', institucion:'locademia', cargo:'jefazo', username:'batman')