class SessionsController < ApplicationController
  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user] = user.id
      head :ok
    else
      head :unauthorized
    end
  end

  def destroy
    session[:user] = nil
    head :no_content
  end
end
