class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.password == params[:password]
      redirect_to '/itineraries/show'
    else
      redirect_to '/'
    end
  end

  def delete
    session.clear
    redirect_to '/'
  end

end
