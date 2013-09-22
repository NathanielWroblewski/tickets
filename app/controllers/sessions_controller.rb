class SessionsController < ApplicationController

  def new
    
  end

  def create
    @user = User.find_by_username(params[:username])
    session[:id] = @user.id if @user.password == params[:password]
    redirect_to 'itineraries#show'
  end

  def delete
    
  end

end
