class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications.all
  end

  def create
    auth = request.env["omniauth.auth"]
    current_user.authentications.create(
      provider: auth["provider"],
      uid: auth["uid"],
      token: auth["credentials"]["token"]
    )
    flash[:notice] = "Authentication successful"
    redirect_to authentications_path
  end
end
