class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id


######
      redirect_to @user #WHERE SHOULD THIS REDIRECT TO?????
#######

    else
      render :new
    end
  end

end
