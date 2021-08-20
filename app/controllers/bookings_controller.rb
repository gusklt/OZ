class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    authorize @booking
    @performance = Performance.find(params[:performance_id])
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @performance = Performance.find(params[:performance_id])
    @booking.performance = @performance
    @booking.user = current_user

    if @booking.save
      redirect_to user_path(current_user)
    else
      redirect_to performance_path(@performance)
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = params[:value]
    if @booking.save
      redirect_to user_path(current_user, anchor: "booking-#{@booking.id}")
    else
      redirect_to edit_performance_booking_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:id, :date, :status)

  end
end
