class UsersController < ApplicationController
  def index
    if current_user && current_user.is_teacher
      @users = User.all
    else
      head :unauthorized
    end
  end
end
