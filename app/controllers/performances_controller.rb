class PerformancesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_performance, only: [:show, :edit, :update, :destroy]

  def index
    @performances = Performance.all
  end

  def show
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
  end

  def performance_params
    params.require(:performance).permit(:title, :location, :description, :price, :photo)
  end
end
