require "rails_helper"

RSpec.describe MentorshipsController, type: :request do
  describe "GET /mentorships" do
    let!(:mentorships) { create_list(:mentorship, 5) }

    before { get "/mentorships" }

    it "returns mentorships" do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
  end

  describe "POST /mentorships" do
    let(:mentor) { create(:mentor) }
    let(:mentee) { create(:mentee) }
    let(:valid_attributes) { { mentorship: { mentor_id: mentor.id, mentee_id: mentee.id } } }

    context "request is valid" do
      before { post "/mentorships", params: valid_attributes }
      it "creates a mentorship" do
        expect(json["mentor_id"]).to eq(mentor.id)
      end
      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end
  end
end
