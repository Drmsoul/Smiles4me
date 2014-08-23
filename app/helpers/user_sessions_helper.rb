module UserSessionsHelper

#  def current_user
#    remember_token = User.digest(cookies[:remember_token])
#    @current_user ||= User.where(remember_token: remember_token).exists?
#  end

 
  def current_user?(user)
    user == current_user
  end



end
