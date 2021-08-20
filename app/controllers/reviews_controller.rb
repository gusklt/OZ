class ReviewsController < ApplicationController

  def create
    @performance = Performance.find(params[:performance_id])
    authorize @performance
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to performance_path(@performance)
    else
      render 'performances/show'
    end
  end

  def index
  end

  def show
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
