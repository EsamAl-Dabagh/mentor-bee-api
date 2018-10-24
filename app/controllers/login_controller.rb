class LoginController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  def authenticate
    user = User.find_by(email: auth_params[:email])
    if user && user.authenticate(auth_params[:password])
      json_response({
        auth_token: JsonWebToken.encode(user_id: user.id),
        user_id: user.id,
        name: user.name,
        email: user.email,
        pic: user.pic
        }, :created)
    else
      raise(ExceptionHandler::AuthenticationError, "Invalid credentials")
    end
  end

  private

    def auth_params
      params.permit(:email, :password)
    end
end
