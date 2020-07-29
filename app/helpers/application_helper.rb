module ApplicationHelper

  def current_user_email
    session[:current_user_email]
  end

end
