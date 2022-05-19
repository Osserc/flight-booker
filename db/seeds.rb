# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.destroy_all
Flight.destroy_all

airport_codes = ["ACA", "ABY", "BRI", "CCU", "DFW", "MSL", "HEL", "LAS", "NGO", "RDV"]

airport_codes.each do | code |
    Airport.create(code:code)
end

Airport.all.each do | airport |
    3.times do
        airport.departing_flights.create(start_datetime:rand(Time.now..8.weeks.from_now).to_date, fligh_duration:rand(60..240), arrival_airport:(Airport.all - [airport]).sample)
    end
end