class ApplicationController < ActionController::API
  include ActionController::ImplicitRender

  def current_user
    @current_user ||= User.find(session[:user]) if session[:user]
  end

  def logged_in?
    !current_user.nil?
  end
end
