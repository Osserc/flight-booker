# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.destroy_all
Flight.destroy_all

# airport_codes = ["ACA", "ABY", "BRI", "CCU", "DFW", "MSL", "HEL", "LAS", "NGO", "RDV"]

# airport_codes.each do | code |
#     Airport.create(code:code)
# end

# Airport.all.each do | airport |
#     3.times do
#         airport.departing_flights.create(start_datetime:(DateTime.now.beginning_of_day + rand(21).days + (rand(48) * 30).minutes), flight_duration:rand(60..240), arrival_airport:(Airport.all - [airport]).sample)
#     end
# end

a1 = Airport.create(code: "AAA", name: "Milano")
a2 = Airport.create(code: "BBB", name: "Cagliari")
a3 = Airport.create(code: "CCC", name: "Bologna")

a1.departing_flights.create(start_datetime: (DateTime.now.beginning_of_day + rand(21).days + (rand(48) * 30).minutes), flight_duration:rand(60..240), arrival_airport: a2)
a2.departing_flights.create(start_datetime: (DateTime.now.beginning_of_day + rand(21).days + (rand(48) * 30).minutes), flight_duration:rand(60..240), arrival_airport: a1)
a3.departing_flights.create(start_datetime: (DateTime.now.beginning_of_day + rand(21).days + (rand(48) * 30).minutes), flight_duration:rand(60..240), arrival_airport: a2)
a1.departing_flights.create(start_datetime: (DateTime.now.beginning_of_day + rand(21).days + (rand(48) * 30).minutes), flight_duration:rand(60..240), arrival_airport: a3)


# rand(DateTime.now..4.weeks.from_now).to_datetime.strftime("%m/%d/%Y %H:%M")