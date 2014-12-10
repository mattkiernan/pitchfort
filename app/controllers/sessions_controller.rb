class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    auth_request = request.env["omniauth.auth"]
    if auth_request.present?
      user = User.from_omniauth(auth_request)
      session[:user_id] = user.id
      session[:token] = auth_request["credentials"]["token"]
      sign_in(user)
      redirect_to root_path
    else
      user = authenticate_session(session_params)
      sign_in_with(user)
    end
  end

 def sign_in_with(user)
   if sign_in(user)
     redirect_to root_path
   else
     render :new
   end
 end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
