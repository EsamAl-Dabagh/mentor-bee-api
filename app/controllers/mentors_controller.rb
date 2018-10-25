class MentorsController < ApplicationController
  def index
    mentors = Mentor.all
    json_response("mentors" => all_mentors_data(mentors))
  end

  def create
    mentor = Mentor.create!(mentor_params)
    json_response({ "mentor" => mentor_data(mentor) }, :created)
  end

  def show
    mentor = Mentor.find_by!(id: params[:id])
    json_response("mentor" => mentor_data(mentor))
  end

  private
    def mentor_params
      params.require(:mentor).permit(:user_id, :bio, :skill)
    end

    def all_mentors_data(mentors)
      mentors.map { |mentor| mentor_data(mentor) }
    end

    def mentor_data(mentor)
      {
        mentor_id: mentor.id,
        user_id: mentor.user_id,
        name: mentor.user.name,
        email: mentor.user.email,
        pic: (request.base_url + "/avatars/#{mentor.user.pic}"),
        bio: mentor.bio,
        skill: mentor.skill
      }
    end
end
