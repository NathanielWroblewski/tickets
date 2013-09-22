class SessionsController < ApplicationController

  def new
    
  end

  def create
    @user = User.find_by_username(params[:username])
    session[:id] = @user.id if @user

#### CORRECT REDIRECT????
    redirect_to @itineraries
####

  end

  def delete
    
  end

end
