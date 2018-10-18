class MentorsController < ApplicationController
  def index
    @mentors = Mentor.all
    json_response(@mentors, :ok)
  end

  def create
    p mentor_params
    @mentor = Mentor.create!(mentor_params)
    p mentor_params
    p @mentor
    json_response(@mentor, :created)
  end

  private
  def mentor_params
    params.require(:mentor).permit(:user_id, :bio, :skill)
  end
end
