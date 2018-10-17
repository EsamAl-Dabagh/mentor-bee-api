class UsersController < ApplicationController
  def index
    @users = User.all
    json_response(@users, :ok)
  end

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :pic)
    end
end
