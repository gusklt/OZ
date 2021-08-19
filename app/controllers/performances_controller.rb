class PerformancesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_performance, only: [:show, :edit, :update, :destroy]

  # rubocop:disable Metrics/MethodLength

  def index
    if params["search"].present?
      if params["search"]["query"].present?
        Performance.algolia_reindex!
        @performances = policy_scope(Performance).order(created_at: :desc)
        return @performances = @performances.algolia_search(params["search"]["query"])
      end
    else
      @performances = policy_scope(Performance).order(created_at: :desc)
    end
    # the `geocoded` scope filters only perforlances with coordinates (latitude & longitude)
    @markers = @performances.geocoded.map do |performance|
      {
        lat: performance.latitude,
        lng: performance.longitude,
        info_window: render_to_string(partial: "info_window", locals: { performance: performance }),
        image_url: helpers.asset_url('marker.png')
      }
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @performance = Performance.new
    authorize @performance
  end

  def create
    @performance = Performance.new(performance_params)
    authorize @performance
    @performance.user = current_user
    if @performance.save
      redirect_to performance_path(@performance)
    else
      redirect_to new_performance_path
    end
  end

  def edit
  end

  def update
    @performance.update(performance_params)
    if @performance.save
      redirect_to performance_path(@performance)
    else
      redirect_to edit_performance_path
    end
  end

  def destroy
    @performance.destroy
    redirect_to performances_path
  end

  private

  def set_performance
    @performance = Performance.find(params[:id])
    authorize @performance
  end

  def performance_params
    params.require(:performance).permit(:title, :location, :description, :price, :photo)
  end
end
