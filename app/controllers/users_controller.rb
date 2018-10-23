class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def index
    @users = User.all
    json_response(@users, :ok)
  end

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    json_response(
      {
        auth_token: auth_token[0],
        user_id: user.id,
        user_name: user.name,
        user_email: user.email,
        user_pic: user.pic
      },
      :created)
  end

  def show
    user = User.find_by!(id: params[:id])
    json_response(user_data(user), :ok)
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :pic)
    end

    def user_data(user)
      {
        id: user.id,
        name: user.name,
        pic: user.pic
       }
    end

  # def find_mentor_info(user)
  #   {
  #     mentor_id: user.mentor.id
  #     mentor_bio: user.mentor.bio,
  #     mentor_skill: user.mentor.skill,
  #    }
  # end
  #
  # def find_mentee_info(user)
  #   {
  #     mentee_id: user.mentee.id
  #     mentee_bio: user.mentee.bio,
  #     mentee_interest: user.mentee.interest
  #    }
  # end
end
