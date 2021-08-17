class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @performance = Performance.find(params[:performance_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @performance = Performance.find(params[:performance_id])
    @booking.performance = @performance
    @booking.user = current_user

    if @booking.save
      redirect_to performances_path
    else
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:id, :date, :status)

  end
end
