class LoginController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  def authenticate
    auth_token_user = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response({
      auth_token: auth_token_user[0],
      user_id: auth_token_user[1].id,
      user_name: auth_token_user[1].name,
      user_email: auth_token_user[1].email,
      user_pic: auth_token_user[1].pic
      }, :created)
  end

  private

    def auth_params
      params.permit(:email, :password)
    end
end
