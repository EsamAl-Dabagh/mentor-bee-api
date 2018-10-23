class MentorsController < ApplicationController
  def index
    mentors = Mentor.all
    json_response(all_mentors_data(mentors), :ok)
  end

  def create
    @mentor = Mentor.create!(mentor_params)
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

    def all_mentors_data(mentors)
      mentors.each do |mentor|
        { mentor.id => { user_id: mentor.user_id, mentor_bio: mentor.bio, mentor_skill: mentor.skill, user_info: mentor_user_data(mentor) } }
      end
    end

    def mentor_user_data(mentor)
      { pic: User.find_by(id:mentor.user_id).pic, name: User.find_by(id: mentor.user_id) }
    end
end
