module Authenticatable
  extend ActiveSupport::Concerns

  private

  def login(user)
    cookies.signed.permanent[:user_id] = user.id
  end

  def logout
    cookies.delete(:user_id)
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end
  
  def logged_in?
    current_user.nil? ? false : true
  end

  def admin_only
  end

  def guest_user_only
    redirect_to root_path if logged_in?
  end
end
