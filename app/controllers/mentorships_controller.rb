class MentorshipsController < ApplicationController
  def index
    mentorships = Mentorship.all
    json_response("mentorships" => all_mentorships_data(mentorships))
  end

  def create
    mentorship = Mentorship.create!(mentorship_params)
    json_response({ "mentorship" => mentorship_data(mentorship) }, :created)
  end

  private
    def mentorship_params
      params.require(:mentorship).permit(:mentor_id, :mentee_id)
    end

    def all_mentorships_data(mentorships)
      mentorships.map { |mentorship| mentorship_data(mentorship) }
    end

    def mentorship_data(mentorship)
      {
        mentorship_id: mentorship.id,
        mentor_id: mentorship.mentor.id,
        mentee_id: mentorship.mentee.id,
        mentor_name: mentorship.mentor.user.name,
        mentee_name: mentorship.mentee.user.name
      }
    end
end
