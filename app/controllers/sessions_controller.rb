class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_username(params[:username])

    # Where da bcrypt at yooooooo!
    if @user && @user.password == params[:password]
      session[:id] = @user.id
      redirect_to '/itineraries/show'
    else
      redirect_to '/', notice: 'Invalid username or password!'
    end
  end

  def delete
    session.clear
    redirect_to '/'
  end
end
