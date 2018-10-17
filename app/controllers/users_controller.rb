class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def create
    @user = User.create!(user_params)
    # When not successful, return exception
    render json: @user, status: :created
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :pic)
    end
end
