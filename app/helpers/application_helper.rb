module ApplicationHelper

  def current_user
    User.find(session[:id]) if session[:id]
  end

end
