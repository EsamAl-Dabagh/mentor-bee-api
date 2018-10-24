class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def index
    users = User.all
    json_response("users" => all_users_data(users))
  end

  def create
    user = User.create!(user_params)
    json_response(
      {
        auth_token: JsonWebToken.encode(user_id: user.id),
        user: user_data(user)
      },
      :created)
  end

  def show
    user = User.find_by!(id: params[:id])
    json_response("user" => user_data(user))
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :pic)
    end

    def all_users_data(users)
      users.map { |user| user_data(user) }
    end

    def user_data(user)
      {
        id: user.id,
        name: user.name,
        email: user.email,
        pic: user.pic,
        mentor_id: get_mentor_id(user),
        mentee_id: get_mentee_id(user)
       }
    end

    def get_mentor_id(user)
      return user.mentor.id if Mentor.find_by(user_id: user.id) || nil
    end

    def get_mentee_id(user)
      return user.mentee.id if Mentee.find_by(user_id: user.id) || nil
    end
end
