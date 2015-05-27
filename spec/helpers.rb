module Helpers
  def login(user)
    session[:user] = user.id
  end
end
