class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to 'session#create'
    else
      render :new
      # add flash notice
    end
  end

end
