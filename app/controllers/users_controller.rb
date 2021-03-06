class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def index
    @announcements = current_user.announcements
    @pitches = current_user.pitches
    @journalists = current_user.journalists
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :provider,
      :uid
    )
  end
end
