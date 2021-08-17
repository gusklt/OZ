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

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    if @booking.save
      redirect_to user_path
    else
      redirect_to edit_performance_booking_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:id, :date, :status)

  end
end
