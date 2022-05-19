class FlightsController < ApplicationController

    def index
        @airports = Airport.all.map { | a | [a.code, a.id] }
        @dates = Flight.all.map { | d | [d.start_datetime.strftime("%m/%d/%Y %H:%M"), d.start_datetime] }
        @flights = collect_flights
    end

    def collect_flights
        Flight.where(departure_airport_id: params[:departure_airport_id], arrival_airport_id: params[:arrival_airport_id], start_datetime: params[:start_datetime]).to_a
    end
    
end
