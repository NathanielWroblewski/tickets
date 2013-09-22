class SessionsController < ApplicationController

  def new
    
  end

  def create
    @user = User.find_by_username(params[:username])
  end

  def delete
    
  end

end
