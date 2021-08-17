class PerformancesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @performances = Performance.all
  end

  def show
    @performance = Performance.find(params[:id])
  end
end
