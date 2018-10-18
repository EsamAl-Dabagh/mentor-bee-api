class MentorsController < ApplicationController
  def index
    @mentors = Mentor.all
    json_response(@mentors, :ok)
  end

  def create
    @mentor = Mentor.create!(mentor_params)
    p @mentor
    json_response(@mentor, :created)
  end

  def show
    @user = Mentor.find_by!(id: params[:id])
    json_response(@user, :ok)
  end

  private
    def mentor_params
      params.require(:mentor).permit(:user_id, :bio, :skill)
    end
end
