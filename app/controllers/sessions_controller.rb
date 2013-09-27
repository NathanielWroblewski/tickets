class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_username(params[:username])

    # Where da bcrypt at yooooooo!
    # AIN'T NOBODY GOT TIME FO DAT!!!
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect_to '/itineraries/show'
    else
      redirect_to '/', notice: 'Invalid username or password!'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
