class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @performances = Performance.all.sample(8)
    @users = User.all.sample(4)
  end
end
