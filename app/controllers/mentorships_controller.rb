class MentorshipsController < ApplicationController
  def index
    @mentorships = Mentorship.all
    json_response(@mentorships, :ok)
  end

  def create
    @mentorship = Mentorship.create!(mentorship_params)
    json_response(@mentorship, :created)
  end

  private
    def mentorship_params
      params.require(:mentorship).permit(:mentor_id, :mentee_id)
    end
end
