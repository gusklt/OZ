class UserController < ApplicationController
  def show
    @user = User.new
  end
end
