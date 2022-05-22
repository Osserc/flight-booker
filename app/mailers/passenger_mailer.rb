class PassengerMailer < ApplicationMailer

    def booking_info_email(booking, passenger)
        @booking = booking
        @passenger = passenger
        mail(to: @passenger.email, subject: "Hi #{@passenger.name}, here's your booking information")
    end

end
