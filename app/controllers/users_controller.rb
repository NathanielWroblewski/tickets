class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect_to '/itineraries/show'
    else
      render :new, notice: 'Error'
    end
  end

end
