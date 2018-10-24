class MenteesController < ApplicationController
  def index
    mentees = Mentee.all
    json_response("mentees" => all_mentees_data(mentees))
  end

  def create
    mentee = Mentee.create!(mentee_params)
    json_response({ "mentee" => mentee_data(mentee) }, :created)
  end

  def show
    mentee = Mentee.find_by!(id: params[:id])
    json_response("mentee" => mentee_data(mentee))
  end

  private
    def mentee_params
      params.require(:mentee).permit(:user_id, :bio, :interest)
    end

    def all_mentees_data(mentees)
      mentees.map { |mentee| mentee_data(mentee) }
    end

    def mentee_data(mentee)
      {
        mentee_id: mentee.id,
        user_id: mentee.user_id,
        name: mentee.user.name,
        email: mentee.user.email,
        pic: mentee.user.pic,
        bio: mentee.bio,
        interest: mentee.interest
      }
    end
end
