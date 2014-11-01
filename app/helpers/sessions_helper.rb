module SessionsHelper

  def current_user
    @user ||= User.find_by(id: session[:user_id])
    # @user = User.find(10) ## Pls keep this here for now...
  end

  def user_logged_in?
    current_user
  end

end
