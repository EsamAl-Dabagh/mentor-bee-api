require "rails_helper"

RSpec.describe MentorshipsController, type: :request do
  describe "GET /mentorships" do
    let!(:mentorships) { create_list(:mentorship, 5) }

    before { get "/mentorships", params: {}, headers: valid_headers }
    it "returns mentorships" do
      expect(json["mentorships"]).not_to be_empty
      expect(json["mentorships"].size).to eq(5)
    end
  end

  describe "POST /mentorships" do
    let(:mentor) { create(:mentor) }
    let(:mentee) { create(:mentee) }

    let(:valid_attributes) { { mentorship: { mentor_id: mentor.id, mentee_id: mentee.id } }.to_json }

    context "request is valid" do
      before { post "/mentorships", params: valid_attributes, headers: valid_headers }
      it "creates a mentorship" do
        expect(json["mentorship"]["mentor_id"]).to eq(mentor.id)
      end
      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end
  end
end
