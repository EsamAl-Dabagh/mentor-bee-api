class MentorsController < ApplicationController
  def index
    @mentors = Mentor.all
    json_response(@mentors, :ok)
  end

  def create
    @mentor = Mentor.create!(mentor_params)
    json_response(@mentor, :created)
  end

  private
    def mentor_params
      params.require(:mentor).permit(:user_id, :bio, :skill)
    end
end
