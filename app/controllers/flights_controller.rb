class FlightsController < ApplicationController

    def index
        @airports = Airport.all.map { | a | [a.name, a.id] }
        @flights = Array.new
        @flights = collect_flights if params.has_key?(:departure_airport_id)
    end

    def collect_flights
        Flight.where(departure_airport_id: params[:departure_airport_id], arrival_airport_id: params[:arrival_airport_id]).where("cast(strftime('%m', start_datetime) as int) = ?", params[:date][:month]).where("cast(strftime('%d', start_datetime) as int) = ?", params[:date][:day]).to_a
    end

end