class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect_to itineraries_path
    else
      render :new
      # add flash notice
    end
  end

end
