class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @performance = Performance.find(params[:performance_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @performance = Performance.find(params[:performance_id])
    @booking.performance = @performance
    @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:id, :date, :status, :user_id, :performance_id)

  end
end
