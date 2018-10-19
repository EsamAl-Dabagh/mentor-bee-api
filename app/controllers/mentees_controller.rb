class MenteesController < ApplicationController
  def index
    @mentees = Mentee.all
    json_response(@mentees, :ok)
  end

  def create
    @mentee = Mentee.create!(mentee_params)
    json_response(@mentee, :created)
  end

  def show
    @user = Mentee.find_by!(id: params[:id])
    json_response(@user, :ok)
  end

  private
    def mentee_params
      params.require(:mentee).permit(:user_id, :bio, :interest)
    end
end
