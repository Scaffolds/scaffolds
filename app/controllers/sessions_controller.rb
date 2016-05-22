class SessionsController < ApplicationController
  before_action :guest_user_only, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: login_params[:email].downcase)

    if user && user.authenticate(login_params[:password])
      login(user)
      redirect_to root_path
    else
      flash.now[:login_error] = 'Invalid email / password combination'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

  private

  def login_params
    params.require(:session).permit(:email, :password)
  end
end
