class PagesController < ApplicationController

  def index
    @user = User.new
   render layout: 'web'
  end

  def show

  end

end
