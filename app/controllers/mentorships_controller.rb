class MentorshipsController < ApplicationController

  def index
    @mentorships = Mentorship.all
    json_response(@mentorships, :ok)
  end
end
