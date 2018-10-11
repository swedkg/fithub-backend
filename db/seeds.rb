# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create([
#     {
#       "id": 11,
#       "first_name": "Sebastian",
#       "last_name": "Eschweiler",
#       "email": "sebastian@codingthesmartway.com",
#       "password": "jklgjkfdsljkl;jdfg"
#     },
#     {
#       "id": 12,
#       "first_name": "Steve",
#       "last_name": "Palmer",
#       "email": "steve@codingthesmartway.com",
#       "password": "jklgjkfdsljkl;jdfg"
#     },
#     {
#       "id": 13,
#       "first_name": "Ann",
#       "last_name": "Smith",
#       "email": "ann@codingthesmartway.com",
#       "password": "jklgjkfdsljkl;jdfg"
#     },
#     {
#       "first_name": "Dimitris",
#       "last_name": "Giannopoulos",
#       "email": "dimitrios.giannopoulos@gmail.com",
#       "password": "jklgjkfdsljkl;jdfg",
#       "id": 14
#     }
#   ])

json = ActiveSupport::JSON.decode(File.read('db.json'))

json["activities_types"].each do |a|
  Country.create!(a['country'], without_protection: true)
end