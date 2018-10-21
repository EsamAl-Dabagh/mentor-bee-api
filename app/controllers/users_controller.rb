class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def index
    @users = User.all
    json_response(@users, :ok)
  end

  def create
    @user = User.create!(user_params)
    auth_token = AuthenticateUser.new(@user.email, @user.password).call
    json_response( { auth_token: auth_token }, :created)
  end

  def show
    @user = User.find_by!(id: params[:id])
    json_response(@user, :ok)
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :pic)
    end
end
