class UsersController < ApplicationController
  before_action :guest_user_only, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(signup_params)

    if @user.save
      login(@user)
      redirect_to root_path
    else
      flash[:notice] = 'signup-error'
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def signup_params
    params.require(:user).permit(:fullname, :email, :password)
  end
end
