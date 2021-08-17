class PerformancesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @performances = Performance.all
  end

  def show
    @performance = Performance.find(params[:id])
  end

  def new
    @performance = Performance.new
  end

  def create
    @performance = Performance.new(performance_params)
    @performance.user = current_user
    if @performance.save
      redirect_to performance_path(@performance)
    else
      redirect_to new_performance_path
    end
  end

  private

  def performance_params
    params.require(:performance).permit(:title, :location, :description, :price, :photo)
  end
end
