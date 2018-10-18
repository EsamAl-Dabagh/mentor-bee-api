class MentorsController < ApplicationController
  def index
    @mentors = Mentor.all
    json_response(@mentors, :ok)
  end
end
