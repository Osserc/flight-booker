class BookingsController < ApplicationController
    before_action :set_flight, only: [ :new, :create ]

    def new
        @booking = @flight.bookings.build
        booking_params[:passengers_number].to_i.times do
            @booking.passengers << Passenger.new
        end
    end

    def create
        @booking = @flight.bookings.create(booking_params)
        @booking.passengers.create(booking_params[:passengers_attributes])
        redirect_to booking_path
    end

    def show
        @booking = Booking.find(params[:id])
    end

    def set_flight
        @flight = Flight.find(booking_params[:flight_id])
    end

    private
    def booking_params
        params.require(:booking).permit(:id, :flight_id, :passengers_number, passengers_attributes: [ :name, :email ])
    end

end
