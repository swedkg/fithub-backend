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

json["activities_logs"].each do |a|
  Activity.create(
    {
      "id": a["id"],
      "title": a["title"],
      "date": a["date"],
      "duration": a["duration"],
      "comment": a["comment"],
      "activity_type_id": a["activity_type_id"],
      "user_id": a["user_id"]
    }
  )

    #   {
    #   "id": 1,
    #   "title": "mauris, rhoncus",
    #   "date": 1541918393000,
    #   "duration": 54,
    #   "comment": "auctor quis,",
    #   "activity_type_id": 12,
    #   "user_id": 1
    # },

  # type.label = a["label"]
  # type.label = "label"
  # type.save
  # puts a["label"]
  # puts type
end